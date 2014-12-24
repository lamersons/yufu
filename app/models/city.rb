class City
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, localize: true

  belongs_to :language

  scope :with_approved_translators, -> do
    cities_ids = Profile::Translator::Base.approved.map &:city_id
    City.where :id.in => cities_ids
  end

  validates_presence_of :name, uniqueness: true
end
