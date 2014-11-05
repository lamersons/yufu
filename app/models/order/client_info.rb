module Order
  class ClientInfo
    include Mongoid::Document
    include Personalized

    has_many :orders, class_name: 'Order::Base'
  end
end