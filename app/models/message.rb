class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :body

  belongs_to :sender,    class_name: 'User', inverse_of: :outbox
  belongs_to :recipient, class_name: 'User', inverse_of: :inbox

  validates_presence_of :body, :sender, :recipient
end
