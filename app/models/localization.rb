class Localization
  include Mongoid::Document

  AVAILABLE_NAMES = (I18n.available_locales.map { |l| l.to_s })

  field :name
  field :enable, type: Mongoid::Boolean, default: false

  scope :enabled, -> {where enable: true}

  validates :name, presence: true, uniqueness: true, inclusion: AVAILABLE_NAMES
end
