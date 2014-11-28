class Currency
  include Mongoid::Document

  field :name,    localize: true
  field :rate,    type: Float,            default: 1.0
  field :default, type: Mongoid::Boolean, default: false

  after_save :resolve_default, if: -> { default_changed? && default }

  validates_numericality_of :rate, greater_than: 0

  def exchange(value)
    value * rate
  end

  def self.default
    where(default: true).first
  end

  protected
  def resolve_default
    Currency.where(default: true, :id.ne => self.id).update default: false
  end
end
