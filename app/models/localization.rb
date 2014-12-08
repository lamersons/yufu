class Localization
  include Mongoid::Document

  field :name
  field :enable, type: Mongoid::Boolean, default: false

  scope :enabled, -> {where enable: true}

  validates :name, presence: true, uniqueness: true, inclusion: AVAILABLE_NAMES
end
