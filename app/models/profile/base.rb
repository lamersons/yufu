module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    delegate :first_name, :middle_name, :last_name, :first_name=, :last_name=, :middle_name=, to: :user

    field :is_active
    field :phone
    field :additional_phone
    field :total_approve, type: Boolean, default: false
    belongs_to :profile_language, class_name: 'Language'

    belongs_to :user

    accepts_nested_attributes_for :user

    scope :approved, -> {where total_approve: true}
  end
end