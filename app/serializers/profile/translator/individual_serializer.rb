class Profile::Translator::IndividualSerializer < Profile::Translator::BaseSerializer
  attributes :_type, :sex, :additions, :birthday, :visa, :visa_till, :needs_job_resident_permit, :can_travel, :has_driving_license, :has_car,
             :passport_num, :passport_till, :passport_country, :years_in_china, :city_id, :native_language_id,
             :profile_language_id, :email, :additional_email,
             :phone, :additional_phone, :qq, :wechat, :skype, :needs_job_resident_permit

  has_many :services
  has_many :educations

  has_many :nearby_city_ids
  has_many :directions
  has_many :nearby_city_with_surcharge_ids


  def nearby_city_ids
    object.nearby_city_ids.map {|id| id.to_s}
  end

  def nearby_city_with_surcharge_ids
    object.nearby_city_with_surcharge_ids.map {|id| id.to_s}
  end

  def city_id
    object.city.try(:id).to_s
  end

  def profile_language_id
    object.profile_language.try(:id).to_s
  end

  def native_language_id
    object.native_language.try(:id).to_s
  end

end
