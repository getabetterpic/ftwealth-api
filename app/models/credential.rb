class Credential < ActiveRecord::Base
  belongs_to :financial_institution
  belongs_to :user
  validates_presence_of :encrypted_password, :encrypted_username
end
