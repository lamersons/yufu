class Translation
  include Mongoid::Document

  field :key, localize: true
  field :value, default: ''

  validates :key, presence: true, uniqueness: true

  def self.[](key)
    tr = where(key: key).first
    tr.present? ? tr.value : ''
  end

end
