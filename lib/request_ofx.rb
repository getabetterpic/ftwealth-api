class RequestOfx
  include HTTParty
  ssl_ca_file 'lib/certs/verisign.pem'

  class << self
    def request_acct_info(credential, passkey, dtacctup = DateTime.now)
      dtacctup = dtacctup.strftime('%Y%m%d%H%M%S.%L')
      dtclient = dtacctup
      fi = credential.financial_institution
      user = credential.user
      cred = credential
      cred.passkey = passkey
      userid = cred.username
      userpass = cred.password

      template = <<-HTML
OFXHEADER:100
DATA:OFXSGML
VERSION=102
SECURITY=NONE
ENCODING=USASCII
CHARSET:1252
COMPRESSION:NONE
OLDFILEUID=NONE
NEWFILEUID=NONE

<OFX>
  <SIGNONMSGSRQV1>
    <SONRQ>
      <DTCLIENT>{{dtclient}}
      <USERID>{{userid}}
      <USERPASS>{{userpass}}
      <LANGUAGE>ENG
    </SONRQ>
  </SIGNONMSGSRQV1>
  <BANKMSGSRQV1>
  <ACCTINFOTRNRQ>
    <ACCTINFORQ>
      <DTACCTUP>{{dtacctup}}
    </ACCTINFORQ>
  </ACCTINFOTRNRQ>
  </BANKMSGSRQV1>
</OFX>
      HTML

      [
        'dtclient',
        'userid',
        'userpass',
        'dtacctup'
      ].each do |element|
        template.gsub!("{{#{element}}}", eval(element).to_s)
      end
      userid = nil
      userpass = nil

      url = URI(fi.url)
      puts "Getting data..."
      response = RequestOfx.post(url, body: template)
      if response.success?
        puts "Response was a success"
      else
        puts "Response was #{response.result}"
      end

      doc = Nokogiri::HTML(response.body)
      doc.xpath('//acctinfo').each do |row|
        reference = row.to_xml[/<acctid>([^<]*)</, 1]
        puts "Finding account #{reference}"
        acct = fi.accounts.find_or_initialize_by(reference: reference)
        acct.user = user
        acct.credential = cred
        acct.account_type = row.to_xml[/<accttype>([^<]*)</, 1]
        acct.description = row.to_xml[/<desc>([^<]*)</, 1]
        acct.bankid = row.to_xml[/<bankid>([^<]*)</, 1]
        acct.save!
      end
    end
  end
end