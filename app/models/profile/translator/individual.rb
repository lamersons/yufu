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
      field :status
      field :pay_way
      field :can_travel,          type: Mongoid::Boolean
      field :has_driving_license, type: Mongoid::Boolean
      field :has_car,             type: Mongoid::Boolean

      belongs_to :native_language, class_name: 'Language'

      embeds_many :services,   class_name: 'Profile::Translator::Service'
      embeds_many :educations, class_name: 'Profile::Education', :cascade_callbacks => true

      has_and_belongs_to_many :nearby_cities,                  class_name: 'City'
      has_and_belongs_to_many :nearby_cities_with_surcharge,   class_name: 'City'
      has_and_belongs_to_many :directions



      accepts_nested_attributes_for :services, :educations


      validates_inclusion_of :grade, in: GRADES
      before_save :set_total_approve, unless: -> { total_approve || total_approve_changed?}



      def approved?
        return true if total_approve
        services.each   {|s| return false unless s.is_approved}
        educations.each {|e| return false unless e.is_approved}
        true
      end



      def set_total_approve
        self.total_approve = approved?
        true
      end
    end
  end
end