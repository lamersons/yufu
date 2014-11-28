module Profile
  class Partner < Base
    has_many :orders, class_name: 'Order::Base', inverse_of: :owner
    has_many :clients, class_name: 'PartnersClient'
  end
end