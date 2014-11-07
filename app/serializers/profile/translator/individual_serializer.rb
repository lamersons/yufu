class Profile::Translator::IndividualSerializer < Profile::Translator::BaseSerializer
  attributes :sex, :additions, :visa, :needs_job_resident_permit, :can_travel, :has_driving_license, :has_car

  has_many :services
  has_many :educations
  has_many :nearby_city
  has_many :directions
  has_many :nearby_city
  has_many :nearby_city_with_surcharge
  belongs_to :native_language
end
