# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_category do
    sequence(:name) {|n| "lan-#{n}"}
  end
end
