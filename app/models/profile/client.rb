module Profile
  class Client < Base
    field :company_name, localize: true
    field :company_uid
    field :country, localize: true

    has_many :orders, class_name: 'Order:Base', inverse_of: :owner
  end
end