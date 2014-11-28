FactoryGirl.define do
  factory :languages_group do
    verbal_prices {[build(:price_verbal)]}
  end

end
