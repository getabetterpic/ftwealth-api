class Transaction < ActiveRecord::Base
  actable
  belongs_to :account
  validates_presence_of :amount, :description, :tran_date
  validates_numericality_of :amount
end
