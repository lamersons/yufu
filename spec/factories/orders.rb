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

    reservation_dates   {[build(:order_reservation_date)]}


    transient do
      reserve_language_criterions_count 5
    end

    after(:create) do |order, evaluator|
      create_list(:order_language_criterion, evaluator.reserve_language_criterions_count,
                  reserve_socket: order) if order.reserve_language_criterions.blank?
      create :order_language_criterion, main_socket: order if order.main_language_criterion.blank?
    end
  end

  factory :order_written, class: Order::Written do
    association :owner, factory: :profile_client
    translation_type 'standard'
    level 'translate_and_correct'
    association :original_language, factory: :language
    translation_languages {[create(:language)]}
    words_number 2000
  end
end