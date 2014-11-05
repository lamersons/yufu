module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    field :first_name,  localize: true
    field :last_name,   localize: true
    field :middle_name, localize: true
    field :phone
    field :additional_phone
    field :approved, type: Boolean, default: false

    embedded_in :user
  end
end