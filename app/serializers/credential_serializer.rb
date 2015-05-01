class CredentialSerializer < ActiveModel::Serializer
  attributes :id, :encrypted_password, :encrypted_username
  has_one :financial_institution
  has_one :user
end
