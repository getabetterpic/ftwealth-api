FactoryGirl.define do
  factory :account do
    user
    financial_institution
    reference "MyString"
    account_type "MyString"
    status "MyString"
    credential
    available_balance "9.99"
    posted_balance "9.99"
    last_synced_at "2015-05-01 08:18:49"
    balance_as_of_date "2015-05-01 08:18:49"
    description "MyString"
    bankid "MyString"
  end

end
