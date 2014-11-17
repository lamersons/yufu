Yufu.ProfilesIndexRoute = Ember.Route.extend({
  model: (params)->
    console.log @modelFor('users.show')
    @store.find('profile', params.id)
})
