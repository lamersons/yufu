class UserSerializer < ActiveModel::Serializer
  include MongoIdSerializer

  attributes :id, :email, :translator_profile_id

  def translator_profile_id
    object.translator_profile.try(:id).to_s
  end
end
