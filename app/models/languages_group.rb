class LanguagesGroup
  include Mongoid::Document

  embeds_many :verbal_prices, class_name: 'Price::Verbal'

  has_many :languages

  accepts_nested_attributes_for :verbal_prices

  def verbal_cost(level, currency = nil)
    price = verbal_prices.where(level: level).first
    price.nil? ? Float::INFINITY : price.cost(currency)
  end
end
