FactoryGirl.define do
  factory :account do
    user nil
financial_institution nil
reference "MyString"
account_type "MyString"
status "MyString"
credential nil
available_balance "9.99"
posted_balance "9.99"
last_synced_at "2015-05-01 07:57:48"
balance_as_of_date "2015-05-01 07:57:48"
description "MyString"
bankid "MyString"
  end

end
