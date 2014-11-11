# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    password 'password'
  end
  factory :translator, class: User do
    sequence(:email) {|n| "user#{100 + n}@example.com"}
    password 'password'
    profiles {[build(:profile_translator_individual)]}
  end
end
