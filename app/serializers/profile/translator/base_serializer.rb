class Profile::Translator::BaseSerializer < Profile::BaseSerializer
  attributes :skype, :qq, :is_active, :city_id


  def city_id
    object.city.try(:id).to_s
  end
end
