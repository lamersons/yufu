module Order
  class LanguageCriterion
    include Mongoid::Document

    field :level
    belongs_to :language

    belongs_to :order, class_name: 'Order::Verbal', inverse_of: :language_criterions

    validates_inclusion_of :level, in: Order::Verbal::TRANSLATION_LEVELS

    def price(currency = nil)
      Price.with_markup cost(currency)
    end

    def cost(currency = nil)
      language.verbal_cost level, currency
    end
  end
end