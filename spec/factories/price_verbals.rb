FactoryGirl.define do
  factory :price_verbal, :class => 'Price::Verbal' do
    value 45.5
    level 'guide'
  end

end
