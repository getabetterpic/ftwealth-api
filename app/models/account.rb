class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :financial_institution
  belongs_to :credential
end
