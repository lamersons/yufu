module MongoIdSerializer
  def id
    object.id.to_s
  end
end


