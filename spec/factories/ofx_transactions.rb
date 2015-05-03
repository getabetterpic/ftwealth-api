FactoryGirl.define do
  factory :ofx_transaction do
    amount "9.99"
description "MyString"
ofx_date "2015-05-03 09:58:31"
ofx_id 1
scheduled_transaction nil
account nil
  end

end
