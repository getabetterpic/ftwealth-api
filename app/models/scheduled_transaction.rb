class ScheduledTransaction < ActiveRecord::Base
  acts_as :tran
  validates_presence_of :recurring
  validates :day_of_month, presence: true, numericality: true
  validates_inclusion_of :day_of_month, in: 1..31
end
