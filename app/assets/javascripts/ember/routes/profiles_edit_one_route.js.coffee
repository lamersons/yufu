Yufu.ProfilesEditOneRoute = Ember.Route.extend({
  model: (params)->
    @store.find('profile', params.id)
})