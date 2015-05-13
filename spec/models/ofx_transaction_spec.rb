require 'rails_helper'

RSpec.describe OfxTransaction, type: :model do
  it { should belong_to :account }
  it { should belong_to :scheduled_transaction }
  it { should belong_to :ofx_call }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :description }
  it { should validate_presence_of :ofx_date }
  it { should validate_presence_of :ofx_id }
  it { should validate_numericality_of :amount }
  it { should validate_numericality_of :ofx_id }
end
