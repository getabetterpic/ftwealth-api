class SyncCapitalOne360
  include HTTParty
  ssl_ca_file 'lib/certs/verisign.pem'

  def get_transactions(account, passkey)
    @account = account
    fi = @account.financial_institution
    @last_call = @account.ofx_calls.order("ofx_calls.created_at DESC").first
    @last_tran = @account.ofx_transactions.order("ofx_transactions.created_at DESC").first
    credential = @account.credential
    credential.passkey = passkey
    userid = credential.username
    userpass = credential.password

    template = fi.ofx_template

    url = URI(fi.url)
    template = fi.ofx_template

    replace = [
      'dtclient',
      'userid',
      'userpass',
      'trnuid',
      'acctid',
      'accttype',
      'dtstart',
      'dtend'
    ]
    replace.each do |element|
      template.gsub!("{{#{element}}}", eval(element).to_s)
    end
    userid = nil
    userpass = nil

    return_ids = []
    ofx_call = @account.ofx_calls.new
    response = SyncCapitalOne360.post(url, body: template)
    if response.success?
      ofx_call.original_document = response.body
      ofx_call.requested_date = requested_date
      ofx_call.trnuid = trnuid
      return_ids = process_response(response, ofx_call)
    else
      raise "Response was #{response.body}"
    end
    return return_ids
  end

  def requested_date
    @requested_date ||= DateTime.now
  end

  def dtclient
    requested_date.strftime("%Y%m%d%H%M%S.%L")
  end

  def trnuid
    @last_call ? ((@last_call.trnuid || 0).to_i + 1).to_s : 1
  end

  def acctid
    @account.reference
  end

  def accttype
    @account.account_type
  end

  def dtstart
    if @last_tran
      (@last_tran.ofx_date || requested_date)
    else
      6.months.ago.beginning_of_day
    end.strftime("%Y%m%d%H%M%S.%L")
  end

  def dtend(requested_date = DateTime.now)
    (requested_date + 1.day).strftime("%Y%m%d%H%M%S.%L")
  end

  def process_response(response, ofx_call)
    ofx_results = response.body
    ofx_doc = Nokogiri::HTML(ofx_results)

    dtacctup = ofx_doc.xpath('//dtacctup')
    ofx_call.dtacctup = if dtacctup
      dtacctup.first.inner_text
    else
      DateTime.now
    end

    available_balance = ofx_doc.xpath('//availbal').first.to_xml[/<BALAMT>([0-9\-\.]*)</mi, 1]
    posted_balance = ofx_doc.xpath('//ledgerbal').first.to_xml[/<BALAMT>([0-9\-\.]*)</mi, 1]
    ofx_call.available_balance = available_balance
    ofx_call.posted_balance = posted_balance
    ofx_call.save!

    return_ids = parse_transactions(ofx_doc, ofx_call)
    update_balances(ofx_call)
    return_ids
  end

  def parse_transactions(ofx_doc, ofx_call)
    transactions = ParseOfx.get_transactions_from_doc(ofx_doc)
    records = []
    errors = []

    transactions.each do |tran_id, tran|
      ofx_tran = ofx_call.ofx_transactions.find_or_initialize_by(ofx_id: tran_id)
      ofx_tran.account = ofx_call.account
      ofx_tran.amount = tran[:amount]
      ofx_tran.ofx_date = DateTime.strptime(tran[:date], "%Y%m%d%H%M%S.%L")
      ofx_tran.description = tran[:description]
      ofx_tran.save
      records << ofx_tran
    end
    records
  end

  def update_balances(ofx_call)
    account = ofx_call.account
    account.available_balance = ofx_call.available_balance
    account.posted_balance = ofx_call.posted_balance
    account.balance_as_of_date = ofx_call.requested_date
    account.save
  end
end