# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translation do
    sequence(:key) {|n| "key-#{n}"}
    value 'sadasd'
  end
end
