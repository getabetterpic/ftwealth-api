class ScheduledTransaction < ActiveRecord::Base
  store_accessor :properties, :paycheck, :recurring
  validates_presence_of :amount, :description, :day_of_month
  validates_numericality_of :amount, :day_of_month
  validates_inclusion_of :day_of_month, in: 1..31

  def paycheck
    return (super == 'true') if %w{true false}.include? super
    super
  end

  def recurring
    return (super == 'true') if %w{true false}.include? super
    super
  end
end
