module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps
    include Personalized

    field :phone
    field :additional_phone
    field :approved, type: Boolean, default: false

    embedded_in :user
  end
end