class PartnerValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    object.errors[attribute] << options[:message] || "#{attribute} should be partner" unless value.partner?
  end
end