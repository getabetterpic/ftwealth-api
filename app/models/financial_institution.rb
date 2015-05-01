class FinancialInstitution < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :fid, uniqueness: true, presence: true
  validates :org, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
end
