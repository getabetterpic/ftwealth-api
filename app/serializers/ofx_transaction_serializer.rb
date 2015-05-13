class OfxTransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :description, :ofx_date, :ofx_id
  #has_one :scheduled_transaction
  #has_one :account
  root :transactions
end
