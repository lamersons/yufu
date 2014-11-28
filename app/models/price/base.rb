module Price
  class Base
    include Mongoid::Document
    field :value, type: Float

    embedded_in :languages_group

    validates_numericality_of :value, greater_than: 0

    def cost(currency = nil)
      currency ||= Currency.default
      currency.exchange value
    end
  end
end
