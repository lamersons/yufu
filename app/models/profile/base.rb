module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    embedded_in :user
  end
end