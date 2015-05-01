class Credential < ActiveRecord::Base
  belongs_to :financial_institution
  belongs_to :user
  has_many :accounts
  validates_presence_of :encrypted_password, :encrypted_username,
    :financial_institution_id, :user_id
end
