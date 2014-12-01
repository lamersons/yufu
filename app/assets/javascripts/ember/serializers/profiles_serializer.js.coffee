Yufu.ProfileSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    services:      {embedded: 'always'}

Yufu.ProfileTranslatorIndivisualSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    services:      {embedded: 'always'}
    nearby_cities: {serialize: 'ids'}
    nearby_cities_with_surcharge: {serialize: 'ids'}