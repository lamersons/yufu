module Profile
  class Partner < Base
    has_many :orders, class_name: 'Order::Base', inverse_of: :owner
  end
end