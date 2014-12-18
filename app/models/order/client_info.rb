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
      read_attribute(:first_name) || order_base.try(:owner).try(:first_name)
    end

    def last_name
      read_attribute(:last_name) || order_base.try(:owner).try(:last_name)
    end
  end
end