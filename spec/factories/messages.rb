FactoryGirl.define do
  factory :message do
    body "MyString"
    association :sender,    factory: :user
    association :recipient, factory: :user
  end

end
