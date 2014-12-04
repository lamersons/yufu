class LanguagesGroup
  include Mongoid::Document

  embeds_many :verbal_prices, class_name: 'Price::Verbal'

  accepts_nested_attributes_for :verbal_prices

  def verbal_cost(level, currency = nil)
    price = verbal_prices.where(level: level).first
    price.nil? ? Float::INFINITY : price.cost(currency)
  end
end
