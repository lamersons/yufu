Yufu.SubresourceOfProfileSerializer = DS.ActiveModelSerializer.extend
  serializeIntoHash: (hash, type, record, options) ->
    @_super hash, type, record, options
    Ember.merge hash, {
      'profile_id': record.get('profile_id')
    }
# Define serializers for all models needs profile_id to save
Yufu.OrderApplicationSerializer = Yufu.SubresourceOfProfileSerializer.extend()
Yufu.PartnersClientSerializer   = Yufu.SubresourceOfProfileSerializer.extend()