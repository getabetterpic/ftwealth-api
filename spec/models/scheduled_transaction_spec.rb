require 'rails_helper'

RSpec.describe ScheduledTransaction, type: :model do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :description }
  it { should validate_presence_of :day_of_month }
  it { should validate_numericality_of :day_of_month }
  it { should validate_numericality_of :amount }
  it { should validate_inclusion_of(:day_of_month).in_range(1..31) }

  it 'sets the default recurring and paycheck attributes correctly' do
    # These are set via database defaults
    @tran = ScheduledTransaction.new
    expect(@tran.recurring).to eq("false")
    expect(@tran.paycheck).to eq("false")
  end
end
