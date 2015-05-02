class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :financial_institution
  belongs_to :credential
  has_many :transactions
  validates_presence_of :credential_id, :user_id, :financial_institution_id
end
