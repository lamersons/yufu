class Notification
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :message

  embedded_in :user
  belongs_to :object, polymorphic: true

  default_scope -> {desc :created_at}
  index({created_at: 1}, {expire_after_seconds: 1.month})
end
