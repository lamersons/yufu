module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps
    include Personalized

    field :is_active
    field :phone
    field :additional_phone
    field :total_approve, type: Boolean, default: false
    belongs_to :profile_language, class_name: 'Language'

    belongs_to :user

    scope :approved, -> {where total_approve: true}

  end
end