require 'rails_helper'

RSpec.describe Credential, type: :model do
  it { should belong_to :financial_institution }
  it { should belong_to :user }
  it { should validate_presence_of :encrypted_password }
  it { should validate_presence_of :encrypted_username }
end
