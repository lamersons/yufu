module Profile
  module Translator
    class Base < Profile::Base
      # contacts info
      field :additional_email
      field :qq
      field :skype

      belongs_to :primary_city, class_name: 'City'

      has_many :orders, class_name: 'Order:Base', inverse_of: :assignee
    end
  end
end