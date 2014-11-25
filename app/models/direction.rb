class Direction
  include Mongoid::Document

  LEVELS = %w(norm nenorm)

  field :name, localize: true
  field :level

  validates :name, uniqueness: true, presence: true
end
