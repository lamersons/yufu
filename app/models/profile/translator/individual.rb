module Profile
  module Translator
    class Individual < Base
      include Mongoid::Paperclip

      GRADES = %w(standard senior)

      field :additions,  localize: true
      field :email
      field :skype
      field :additional_phone
      field :additional_email
      field :phone
      field :qq
      field :wechat
      field :sex
      field :visa
      field :visa_till, type: DateTime
      field :needs_job_resident_permit, type: Mongoid::Boolean
      field :passport_number
      field :birthday, type: DateTime
      field :grade, default: 'standard'
      field :passport_num
      field :passport_till, type: DateTime
      field :passport_country
      field :years_in_china, type: Integer
      belongs_to :city


      field :can_travel,          type: Mongoid::Boolean
      field :has_driving_license, type: Mongoid::Boolean
      field :has_car,             type: Mongoid::Boolean

      belongs_to :native_language, class_name: 'Language'

      embeds_many :services,   class_name: 'Profile::Translator::Service'
      embeds_many :educations, class_name: 'Profile::Education'

      has_and_belongs_to_many :nearby_city,                  class_name: 'City'
      has_and_belongs_to_many :nearby_city_with_surcharge,   class_name: 'City'
      has_and_belongs_to_many :directions


      accepts_nested_attributes_for :services
      has_mongoid_attached_file :avatar
      validates_attachment_content_type :avatar, content_type: %w(image/jpg image/jpeg image/png)

      validates_inclusion_of :grade, in: GRADES
    end
  end
end