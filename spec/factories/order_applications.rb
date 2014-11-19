# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_application, :class => 'Order::Application' do
    order {create :order_base, state: :wait_application}
    association :translator, factory: :profile_translator_individual
  end
end
