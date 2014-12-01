class Profile::Translator::CompanySerializer < Profile::Translator::BaseSerializer
  attributes :id, :name, :company_uid, :years_in_business, :location, :service_phone, :email, :contacts_person,
             :additional_email, :address

  #has_many :profile_translator_employees
end
