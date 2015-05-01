require 'rails_helper'

RSpec.describe FinancialInstitution, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :fid }
  it { should validate_presence_of :org }
  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :fid }
  it { should validate_uniqueness_of :org }
  it { should validate_uniqueness_of :url }
  it { should have_many :credentials }
  it { should have_many :accounts }
end
