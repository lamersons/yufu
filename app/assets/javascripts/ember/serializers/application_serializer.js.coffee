#Yufu.ApplicationSerializer = DS.ActiveModelSerializer.extend
## hash: the individual object in the payload, ie. {id: 5, type: 'GroceryTask'}
## prop: the root key for the payload, ie. 'task'
#  extractTypeName: (prop, hash) ->
#    if hash.type
#      @typeForRoot hash.type
#    else
#      @typeForRoot prop
#
## allow the sti serializers to override this easily.
#  primaryTypeName: (primaryType) ->
#    primaryType.typeKey
#
#  extractSingle: (store, primaryType, payload, recordId, requestType) ->
#    payload = @normalizePayload(primaryType, payload)
#    #***************************************************
#    primaryTypeName = @primaryTypeName(primaryType) #<======= Change I
#    #***************************************************
#    primaryRecord = undefined
#    for prop of payload
#      typeName = @typeForRoot(prop)
#      type = store.modelFor(typeName)
#      isPrimary = type.typeKey is primaryTypeName
#      # legacy support for singular resources
#      if isPrimary and Ember.typeOf(payload[prop]) isnt "array"
#        hash = payload[prop]
#        #***************************************************
#        typeName = @extractTypeName(prop, hash) #<========== Change II
#        #***************************************************
#        primaryType = store.modelFor(typeName)
#        primaryRecord = @normalize(primaryType, payload[prop], prop)
#        continue
#
#      #jshint loopfunc:true
#      for hash in payload[prop]
#        #***************************************************
#        typeName = @extractTypeName(prop, hash)#<=========== Change II
#        #***************************************************
#        type = store.modelFor(typeName)
#        typeSerializer = store.serializerFor(type)
#        hash = typeSerializer.normalize(type, hash, prop)
#        isFirstCreatedRecord = isPrimary and not recordId and not primaryRecord
#        isUpdatedRecord = isPrimary and @coerceId(hash.id) is recordId
#
#        # find the primary record.
#        #
#        # It's either:
#        # * the record with the same ID as the original request
#        # * in the case of a newly created record that didn't have an ID, the first
#        #   record in the Array
#        if isFirstCreatedRecord or isUpdatedRecord
#          primaryRecord = hash
#        else
#          store.push typeName, hash
#
#    primaryRecord
#
#Yufu.OrderSerializer = Yufu.ApplicationSerializer.extend
#
#  primaryTypeName: (primaryType) ->
#    'order'
#  serializeIntoHash: (data, type, record, options) ->
#    root = 'order'
#    data[root] = this.serialize(record, options)
#
#Yufu.OrderVerbalSerializer = Yufu.OrderSerializer.extend()