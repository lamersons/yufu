module Order
  class LanguageCriterion
    include Mongoid::Document
    LEVELS = [1, 2, 3]

    field :level
    field :cost,  type: Float
    belongs_to :language

    embedded_in :order_verbal
  end
end