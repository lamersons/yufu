Yufu.ProfileSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, type, record, options) ->
    hash['profile'] = @serialize record, options

  attrs:
    services_attributes: {embedded: 'always'}
    nearby_cities: {serialize: 'ids'}
    nearby_cities_with_surcharge: {serialize: 'ids'}

Yufu.ProfileTranslatorBaseSerializer = Yufu.ProfileSerializer.extend()

Yufu.ProfileTranslatorIndividualSerializer = Yufu.ProfileSerializer.extend()

Yufu.ProfileTranslatorCompanySerializer = Yufu.ProfileSerializer.extend()