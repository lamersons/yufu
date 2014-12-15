module Order
  class ClientInfo
    include Mongoid::Document
    include MultiParameterAttributes
    include Personalized
    CONTRIES = ['Svaziland', 'Jamaica', 'Russia']
    field :birthday, type: Date
    field :company
    field :country

    embedded_in :order_base

    def first_name
      read_attribute(:first_name) || order.owner.try(:first_name)
    end

    def last_name
      read_attribute(:last_name) || order.owner.try(:last_name)
    end


    belongs_to :profile_partner, class_name: 'Profile::Partner', inverse_of: 'clients'
    embedded_in :order, class_name: 'Order::Base'
  end
end