Yufu.MessageSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,

  attrs:
    attachments: {embedded: 'always'}