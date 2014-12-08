module Order
  class ClientInfo
    include Mongoid::Document
    include MultiParameterAttributes
    include Personalized
    CONTRIES = ['Svaziland', 'Jamaica', 'Russia']
    field :birthday, type: Date
    field :company
    field :country

    def first_name
      if read_attribute(:first_name).blank?
       return order.owner.first_name
      else
        return read_attribute :first_name
      end
    end

    def last_name
      if read_attribute(:last_name).blank?
        return order.owner.last_name
      else
        return read_attribute :last_name
      end
    end


    belongs_to :profile_partner, class_name: 'Profile::Partner', inverse_of: 'clients'
    embedded_in :order, class_name: 'Order::Base'
  end
end