# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

Yufu.Store = DS.Store.extend({
  adapter: '-active-model'
  push: (type, data, _partial) ->
    oldType = type
    dataType = data.type
    modelType = oldType
    if dataType and (@modelFor(oldType) != @modelFor(dataType))
      modelType = dataType
      if oldRecord = @getById(oldType, data.id) #get rid of the empty supertype
        @dematerializeRecord(oldRecord)
    @_super @modelFor(modelType), data, _partial
})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
Yufu.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1'
})
