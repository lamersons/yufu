class Direction
  include Mongoid::Document

  LEVELS = %w(norm nenorm)

  field :name, localize: true

  validates :name, uniqueness: true, presence: true
end
