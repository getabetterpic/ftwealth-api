require 'rails_helper'

RSpec.describe OfxCall, type: :model do
  it { should belong_to :account }
  it { should belong_to :financial_institution }
  it { should have_many :ofx_transactions }
  it { should validate_presence_of :original_document }
  it { should validate_presence_of :requested_date }
end
