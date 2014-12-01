Yufu.ProfileSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    services_attributes:      {embedded: 'always'}
    nearby_cities: {serialize: 'ids'}
    nearby_city_with_surcharge: {serialize: 'ids'}