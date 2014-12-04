Yufu.EducationSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, type, record, options) ->
    hash['profile'] = @serialize record, options

  attrs:
    documents: {embedded: 'always'}