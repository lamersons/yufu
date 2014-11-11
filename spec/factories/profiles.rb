FactoryGirl.define do
  factory :profile_translator_individual, class: Profile::Translator::Individual do
    first_name 'name'
    last_name 'name 2'
  end

  factory :profile_translator_company, class: Profile::Translator::Company do
    first_name 'name'
    last_name 'name 2'
  end
end