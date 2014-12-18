class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :recipient_id, :sender_id, :from_backoffice

  def sender_id
    @object.sender_id.to_s
  end

  def recipient_id
    @object.recipient_id.to_s
  end

  def from_backoffice
    @object.sender.is_a? Admin
  end
end
