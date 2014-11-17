module Order
  class Car
    include Mongoid::Document

    field :name, localize: true
    field :cost, type: Float
  end
end