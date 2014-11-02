# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :education, class: 'Profile::Education' do
    grade "MyString"
    specialization "MyString"
    university "MyString"
    location "MyString"
  end
end
