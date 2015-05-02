class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :description, :tran_date
  has_one :account
end
