module Order
  class LanguageCriterion
    include Mongoid::Document
    LEVELS = [1, 2, 3]

    field :level, type: Integer
    field :cost,  type: Float
    belongs_to :language

    embedded_in :order_verbal
  end
end