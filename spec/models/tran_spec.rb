require 'rails_helper'

RSpec.describe Tran, type: :model do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :description }
  it { should validate_presence_of :tran_date }
  it { should validate_numericality_of :amount }
end
