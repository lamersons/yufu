Yufu.ProfilesIndexRoute = Ember.Route.extend({
  model: (params)->
    @store.find('profile_translator_individual', params.id)
})
