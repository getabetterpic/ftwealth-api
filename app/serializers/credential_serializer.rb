class CredentialSerializer < ActiveModel::Serializer
  attributes :id
  has_one :financial_institution
  has_one :user
end
