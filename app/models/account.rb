class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :financial_institution
  belongs_to :credential
  has_many :ofx_transactions
  has_many :scheduled_transactions
  validates_presence_of :credential_id, :user_id, :financial_institution_id
end
