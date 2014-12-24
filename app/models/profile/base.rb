module Profile
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps

    delegate :first_name, :middle_name, :last_name, :first_name=, :last_name=, :middle_name=, :email, :avatar,
             :avatar_file_size, :avatar_file_name, :avatar_content_type, :avatar_file_size=, :avatar_file_name=,
             :avatar_content_type=, :avatar=, to: :user

    field :phone
    field :additional_phone
    field :total_approve, type: Boolean, default: false
    belongs_to :profile_language, class_name: 'Language'

    belongs_to :user

    scope :approved, -> {where total_approve: true}
    validates_presence_of :user

    after_save if: -> {user.changed?} do
      user.save
    end
  end
end