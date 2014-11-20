class Profile::Translator::IndividualSerializer < Profile::Translator::BaseSerializer
  attributes :_type, :sex, :additions, :birthday, :visa, :needs_job_resident_permit, :can_travel, :has_driving_license, :has_car,
             :passport_num, :passport_till, :passport_country, :years_in_china, :city_id, :native_language_id, :email, :additional_email,
             :phone, :additional_phone, :qq, :wechat, :skype

  has_many :services
  has_many :educations
  has_many :nearby_city
  has_many :directions
  has_many :nearby_city
  has_many :nearby_city_with_surcharge
  has_one :native_language

  def city_id
    object.city.try(:id).to_s
  end

  def native_language_id
    object.native_language.try(:id).to_s
  end

end
