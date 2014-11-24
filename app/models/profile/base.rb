module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps
    include Personalized

    field :phone
    field :additional_phone
    field :approved, type: Boolean, default: false
    belongs_to :profile_language, class_name: 'Language'

    belongs_to :user

    def orders
      raise NotImplementedError.new('You must implement orders.')
    end
  end
end