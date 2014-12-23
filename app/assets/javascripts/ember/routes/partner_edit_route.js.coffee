# For more information see: http://emberjs.com/guides/routing/

Yufu.PartnerEditRoute = Ember.Route.extend
  model: (params)->
    @store.find 'profile', params.id

