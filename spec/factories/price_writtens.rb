FactoryGirl.define do
  factory :price_written, :class => 'Price::Written' do
    value 45.5
    level 'law'
  end

end
