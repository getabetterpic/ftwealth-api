require 'rails_helper'

RSpec.describe Credential, type: :model do
  it { should belong_to :financial_institution }
  it { should belong_to :user }
  it { should have_many :accounts }
  it { should validate_presence_of :encrypted_password }
  it { should validate_presence_of :encrypted_username }
  it { should validate_presence_of :financial_institution_id }
  it { should validate_presence_of :user_id }
end
