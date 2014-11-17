class ClientValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    object.errors[attribute] << options[:message] || "#{attribute} should be client" unless value.client?
  end
end