module Profile::Translator
  class Company < Base

    field :name, localize: true
    field :company_uid
    field :years_in_business, type: Integer
    field :location
    field :service_phone

    embeds_many :employees, class_name: 'Profile::Translator::Employee'

    accepts_nested_attributes_for :employees
  end
end
