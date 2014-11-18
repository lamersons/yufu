Yufu.ProfilesIndexRoute = Ember.Route.extend({
  model: (params)->
    @store.find('profile', params.id)
})
