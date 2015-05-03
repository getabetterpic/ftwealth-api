class OfxCall < ActiveRecord::Base
  belongs_to :account
  belongs_to :financial_institution
end
