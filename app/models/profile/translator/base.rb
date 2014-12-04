module Profile
  module Translator
    class Base < Profile::Base
      # contacts info
      field :qq
      field :skype
      field :is_active, type: Mongoid::Boolean

      belongs_to :primary_city, class_name: 'City'

      has_many :orders, class_name: 'Order::Base', inverse_of: :assignee
      has_many :applications, class_name: 'Order::Application'

      after_save :resolve_active, if: -> { is_active_changed? && is_active }

      protected
      def resolve_active
        self.user.translator_profiles.where(is_active: true, :id.ne => self.id).update is_active: false
      end
    end
  end
end