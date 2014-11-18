module Order
  class ClientInfo
    include Mongoid::Document
    include Personalized

    belongs_to :profile_partner, class_name: 'Profile::Partner', inverse_of: 'clients'
    has_many :orders, class_name: 'Order::Base'
  end
end