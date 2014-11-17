Yufu.UserAdapter = DS.RESTAdapter.extend({
  namespace: "api/v1"
});


Yufu.UsersRoute = Ember.Route.extend({
  model: (params)->
    @store.find('user', params.id)
})