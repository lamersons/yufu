module Personalized
  extend ActiveSupport::Concern

  included do
    field :first_name
    field :last_name
    field :middle_name, localize: true
  end

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end
end


