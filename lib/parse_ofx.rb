class ParseOfx
  class << self
    def get_transactions_from_doc(doc)
      transactions = {}
      doc.xpath('//stmttrn').each_with_index do |row, i|
        tran_id = row.to_xml[/<fitid>([0-9]*)</,1]
        date = row.to_xml[/<dtposted>([0-9\.]*)</,1]
        amount = row.to_xml[/<trnamt>([0-9\-\.]*)</,1]
        description = row.to_xml[/<name>([^<]*)</,1]
        tran_type = row.to_xml[/<trntype>([a-zA-Z]*)</,1]
        transactions[tran_id] = {
          :date => date,
          :amount => amount,
          :description => description,
          :tran_type => tran_type
        }
      end
      transactions
    end

    def get_accounts_from_doc(doc)
      
    end
  end
end