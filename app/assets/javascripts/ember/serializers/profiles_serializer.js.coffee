Yufu.ProfileSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    services: {embedded: 'always'}