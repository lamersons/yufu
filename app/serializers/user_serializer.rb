class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :translator_profile_id, :is_translator, :is_partner, :is_client, :partner_profile_id,
             :can_manage_localizations, :localizations, :avatar_url, :duplicate_messages_on_email,
             :duplicate_messages_on_sms

  def avatar_url
    @object.avatar.url
  end

  def translator_profile_id
    object.translator_profile.try(:id).to_s
  end

  def partner_profile_id
    object.partner_profile.try(:id).to_s
  end

  def localizations
    object.localization_ids.map &:to_s
  end
end
