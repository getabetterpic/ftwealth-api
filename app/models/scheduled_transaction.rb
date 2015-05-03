class ScheduledTransaction < ActiveRecord::Base
  store_accessor :properties, :paycheck, :recurring
  validates_presence_of :amount, :description, :day_of_month
  validates_numericality_of :amount, :day_of_month
  validates_inclusion_of :day_of_month, in: 1..31
  has_many :ofx_transactions
  belongs_to :account

  PROPERTIES = [
    'paycheck',
    'recurring'
  ]

  PROPERTIES.each do |prop|
    define_method(prop) do
      if read_attribute(prop) == 'true'
        true
      else
        false
      end
    end
  end
end
