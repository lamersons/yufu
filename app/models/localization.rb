class Localization
  include Mongoid::Document

  AVAILABLE_NAMES = (Rails.application.config.i18n.available_locales.map &:to_s)


  field :name
  field :enable, type: Mongoid::Boolean, default: false

  belongs_to :language

  scope :enabled, -> {where enable: true}

  validates :name, presence: true, uniqueness: true, inclusion: AVAILABLE_NAMES
  validates :language, presence: true, uniqueness: true

  delegate :name, to: :language, prefix: true
end
