class BackofficeMessage < Message
  default_scope -> {where recipient: nil}

  def self.model_name
    Message.model_name
  end

  def self._types
    ['Message']
  end
end