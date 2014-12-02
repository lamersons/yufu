module Order
  class Hotel
    include Mongoid::Document
    include MultiParameterAttributes

    field :greeted_at, type: Time
    field :info
    field :additional_info
    field :have_not_yet_booked, type: Boolean
  end

end
