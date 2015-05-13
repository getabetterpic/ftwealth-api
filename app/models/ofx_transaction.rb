class OfxTransaction < ActiveRecord::Base
  belongs_to :scheduled_transaction
  belongs_to :account
  belongs_to :ofx_call
  validates_presence_of :amount, :description, :ofx_date, :ofx_id
  validates_numericality_of :amount, :ofx_id
end
