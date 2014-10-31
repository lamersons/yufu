class ServiceCategory
  include Mongoid::Document

  field :name, localize: true

  validates :name, uniqueness: true, presence: true
end
