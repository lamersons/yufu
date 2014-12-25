# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    password 'password'
  end

  factory :translator, class: User do
    sequence(:email) {|n| "translator#{100 + n}@example.com"}
    password 'password'
    profiles {[build(:profile_translator_individual)]}
  end

  factory :partner, class: User do
    sequence(:email) {|n| "user#{200 + n}@example.com"}
    password 'password'
    profiles {[build(:profile_partner)]}
  end

  factory :client, class: User do
    sequence(:email) {|n| "user#{300 + n}@example.com"}
    password 'password'
    profiles {[build(:profile_client)]}
  end
end
