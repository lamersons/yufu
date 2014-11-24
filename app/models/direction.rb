class Direction
  include Mongoid::Document

  field :name, localize: true
  field :level

  validates :name, uniqueness: true, presence: true
  validates :level, inclusion: LEVELS
end
