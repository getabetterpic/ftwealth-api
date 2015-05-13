class OfxCall < ActiveRecord::Base
  belongs_to :account
  belongs_to :financial_institution
  has_many :ofx_transactions
  validates_presence_of :original_document, :requested_date
end
