class ScheduledTransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :description, :day_of_month, :properties
end
