FactoryGirl.define do
  factory :profile_translator_individual, class: Profile::Translator::Individual do
    association :user
    first_name 'name'
    last_name 'name 2'
  end

  factory :translator_company, class: Profile::Translator::Company do
    association :user
    first_name 'name'
    last_name 'name 2'
  end

  factory :profile_partner, class: Profile::Partner do
    association :user
    first_name 'name'
    last_name 'name 2'
  end

  factory :profile_client, class: Profile::Client do
    association :user
    first_name 'name'
    last_name 'name 2'
  end
end