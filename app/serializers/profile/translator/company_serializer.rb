class Profile::Translator::CompanySerializer < Profile::Translator::Base
 # attributes :id, :name, :company_uid, :years_in_business, :location, :service_phone

  has_many :profile_translator_employees
end
