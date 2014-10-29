class City
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :language

  validates_presence_of :name, uniqueness: true
end
