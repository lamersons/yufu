class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :message, :object_type, :object_id

  def object_id
    @object.object_id.to_s
  end
end
