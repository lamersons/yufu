class LanguagesGroup
  include Mongoid::Document

  embeds_many :verbal_prices, class_name: 'Price::Verbal'

  def verbal_cost(level, currency = nil)
    verbal_prices.where(level: level).first.try(:cost, currency)
  end
end
