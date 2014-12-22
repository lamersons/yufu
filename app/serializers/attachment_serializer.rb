class AttachmentSerializer < ActiveModel::Serializer
  attributes :id, :file_name, :url

  def file_name
    @object.data_file_name
  end
end
