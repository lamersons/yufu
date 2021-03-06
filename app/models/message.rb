class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Notificable

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

  after_create :send_dublicates, :notify

  acts_as_notificable users_scope: :recipient, message: I18n.t('notifications.new_messages')

  def from_backoffice?
    sender.is_a? Admin
  end
  alias :from_backoffice :from_backoffice?
  
  private
  def send_dublicates
    if recipient.present? && recipient.duplicate_messages_on_email?
      MessagesMailer.create(self).deliver
    end
  end
end
