module Profile
  module Translator
    class Individual < Base
      include Mongoid::Paperclip

      field :additions,  localize: true

      field :sex
      field :visa
      field :needs_job_resident_permit, type: Boolean
      has_mongoid_attached_file :avatar

      # contacts info
      field :additional_email
      field :qq
      field :skype

      belongs_to :native_language, class_name: 'Language'
      belongs_to :primary_city,    class_name: 'City'

      embeds_many :services,   class_name: 'Profile::Translator::Service'
      embeds_many :educations, class_name: 'Profile;;Education'

      has_and_belongs_to_many :nearby_city,                class_name: 'City'
      has_and_belongs_to_many :nearby_city_with_surcharge, class_name: 'City'

      validates_attachment_content_type :file, content_type: %w(image/jpg image/jpeg image/png)
    end
  end
end