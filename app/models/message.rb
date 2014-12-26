class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :body

  belongs_to :sender,    class_name: 'User', inverse_of: :outbox
  belongs_to :recipient, class_name: 'User', inverse_of: :inbox

  default_scope -> {desc :created_at}
  scope :backoffice_inbox,  -> {where recipient: nil}
  scope :backoffice_outbox, -> {where :sender.in => Admin.all.map(&:id)}

  has_and_belongs_to_many :attachments

  accepts_nested_attributes_for :attachments

  validates_presence_of :body, :sender

  validates_associated :attachments

  def from_backoffice?
    sender.is_a? Admin
  end
  alias :from_backoffice :from_backoffice?
end
