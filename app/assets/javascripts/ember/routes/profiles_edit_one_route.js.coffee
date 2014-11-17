Yufu.ProfilesRoute = Ember.Route.extend({
  model: (params)->
    @store.find('user', params.user_id)
})

Yufu.ProfilesEditOneRoute = Ember.Route.extend({
  model: (params)->
    this.store.find('profile',  params.id, {user: @modelFor('profiles').id})
})