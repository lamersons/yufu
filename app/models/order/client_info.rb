module Order
  class ClientInfo
    include Mongoid::Document
    include MultiParameterAttributes
    include Personalized
    CONTRIES = ['Svaziland', 'Jamaica', 'Russia']
    field :birthday, type: Date
    field :company
    field :country

    belongs_to :profile_partner, class_name: 'Profile::Partner', inverse_of: 'clients'
    has_many :order, class_name: 'Order::Base'
  end
end