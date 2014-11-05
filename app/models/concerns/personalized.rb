module Personalized
  extend ActiveSupport::Concern

  included do
    field :first_name,  localize: true
    field :last_name,   localize: true
    field :middle_name, localize: true
  end

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end
end


