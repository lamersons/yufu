FactoryGirl.define do
  factory :order_base, class: Order::Base do
    state :new
  end
end