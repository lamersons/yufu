class TranslatorValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    object.errors[attribute] << options[:message] || "#{attribute} should be translator" unless value.translator?
  end
end