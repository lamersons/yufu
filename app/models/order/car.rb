class Order::Car
  include Mongoid::Document

  field :name, localize: true
  field :cost, type: Float
end
