require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should belong_to :user }
  it { should belong_to :financial_institution }
  it { should belong_to :credential }
  it { should have_many :ofx_transactions }
  it { should have_many :scheduled_transactions }
  it { should validate_presence_of :credential_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :financial_institution_id }
  it { should validate_uniqueness_of(:reference).scoped_to(:financial_institution_id) }
end
