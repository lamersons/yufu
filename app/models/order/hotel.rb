module Order
  class Hotel
    include Mongoid::Document

    field :greeted_at, type: Time
    field :info
    field :additional_info
  end

end
