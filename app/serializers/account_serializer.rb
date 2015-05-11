class AccountSerializer < ActiveModel::Serializer
  attributes :id, :reference, :account_type, :status, :available_balance, :posted_balance, :last_synced_at, :balance_as_of_date, :description, :bankid
  has_one :user
  has_one :financial_institution
  has_one :credential
  root :accounts
end
