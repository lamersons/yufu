FactoryGirl.define do
  factory :order_base, class: Order::Base do
    state :new
  end

  factory :order_verbal, class: Order::Verbal do

    include_near_city true
    translator_sex 'male'
    association :owner,                      factory: :profile_client
    association :location,                   factory: :city
    association :translator_native_language, factory: :language
    association :native_language,            factory: :language

    language_criterions {[build(:order_language_criterion)]}
    reservation_dates   {[build(:order_reservation_date)]}
  end
end