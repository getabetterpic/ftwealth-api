class ScheduledTransactionSerializer < ActiveModel::Serializer
  attributes :id, :recurring, :day_of_month, :paycheck
end
