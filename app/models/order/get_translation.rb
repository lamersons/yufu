module Order
  class GetTranslation
    include Mongoid::Document

    embedded_in :order_written, class_name: 'Order::Written'

    field :email
    field :additional

  end
end