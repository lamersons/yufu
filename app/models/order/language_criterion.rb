module Order
  class LanguageCriterion
    include Mongoid::Document

    field :level
    belongs_to :language

    belongs_to :main_order, class_name: 'Order::Verbal', inverse_of: :main_language_criterion
    belongs_to :reserve_order, class_name: 'Order::Verbal', inverse_of: :reserve_language_criterions

    validates_inclusion_of :level, in: Order::Verbal::TRANSLATION_LEVELS

    def price(currency = nil)
      Price.with_markup cost(currency)
    end

    def cost(currency = nil)
      language.verbal_cost level, currency
    end
  end
end