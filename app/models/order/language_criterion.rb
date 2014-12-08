module Order
  class LanguageCriterion
    include Mongoid::Document
    LEVELS = [1, 2, 3]

    field :level
    field :cost,  type: Float
    belongs_to :language

    belongs_to :order, class_name: 'Order::Verbal', inverse_of: :language_criterions

    def cost(currency = nil)
      language.verbal_cost level, currency
    end
  end
end