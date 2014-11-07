module Profile
  module Translator
    class Individual < Base
      include Mongoid::Paperclip

      field :additions,  localize: true

      field :sex
      field :visa
      field :needs_job_resident_permit, type: Mongoid::Boolean

      field :can_travel,          type: Mongoid::Boolean
      field :has_driving_license, type: Mongoid::Boolean
      field :has_car,             type: Mongoid::Boolean

      belongs_to :native_language, class_name: 'Language'

      embeds_many :services,   class_name: 'Profile::Translator::Service'
      embeds_many :educations, class_name: 'Profile::Education'

      has_and_belongs_to_many :nearby_city,                  class_name: 'City'
      has_and_belongs_to_many :nearby_city_with_surcharge,   class_name: 'City'
      has_and_belongs_to_many :directions

      has_mongoid_attached_file :avatar
      validates_attachment_content_type :avatar, content_type: %w(image/jpg image/jpeg image/png)
    end
  end
end