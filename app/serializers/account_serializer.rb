class AccountSerializer < ActiveModel::Serializer
  attributes :id, :reference, :account_type, :status, :available_balance,
    :posted_balance, :last_synced_at, :balance_as_of_date, :description, :bankid,
    :links, :monthly_average_expenses
  #has_one :user
  #has_one :financial_institution
  #has_one :credential
  root :accounts

  def links
    {
      #ofx_transactions: "/accounts/#{object.id}/ofx_transactions/",
      credential: "/api/v1/credentials/#{object.credential_id}",
      transactions: "/api/v1/accounts/#{object.id}/ofx_transactions"
      #recurring_transactions: "/accounts/#{object.id}/recurring_transactions"
    }
  end
end
