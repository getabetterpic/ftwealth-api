class FinancialInstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name, :fid, :org, :url, :last_ofx_validation, :last_ssl_validation, :ofx_template, :sync_type, :sync_class
end
