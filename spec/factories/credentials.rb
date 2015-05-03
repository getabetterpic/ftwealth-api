FactoryGirl.define do
  factory :credential do
    encrypted_password "some string"
    encrypted_username "some string"
    financial_institution
    user
  end

end
