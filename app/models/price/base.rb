module Price
  class Base
    include Mongoid::Document
    field :value,  type: Float
    field :level,  type: String

    embedded_in :languages_group

    validates_numericality_of :value, greater_than: 0
    validates :level, presence: true

    def cost(currency = nil)
      currency ||= Currency.default
      currency.exchange value
    end

    def name
      "Level - #{level}"
    end
  end
end
