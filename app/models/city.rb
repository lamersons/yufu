class City
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, localize: true

  belongs_to :language

  validates_presence_of :name, uniqueness: true
end
