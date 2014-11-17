module Order
  class LanguageCriterion
    include Mongoid::Document

    field :level, type: Integer
    field :cost,  type: Float
    belongs_to :language

    embedded_in :order_verbal
  end
end