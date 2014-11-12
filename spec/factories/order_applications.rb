# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_application, :class => 'Order::Application' do
    association :order, factory: :order_base
    association :translator
  end
end
