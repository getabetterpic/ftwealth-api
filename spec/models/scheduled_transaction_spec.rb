require 'rails_helper'

RSpec.describe ScheduledTransaction, type: :model do
  it { should validate_presence_of :recurring }
  it { should validate_presence_of :day_of_month }
  it { should validate_numericality_of :day_of_month }
  it { should validate_inclusion_of(:day_of_month).in_range(1..31) }
end
