FactoryGirl.define do
  factory :service, class: 'Profile::Translator::Service' do
    level "expert"
    has_hsk true
    association :language
    is_approved true
  end
end
