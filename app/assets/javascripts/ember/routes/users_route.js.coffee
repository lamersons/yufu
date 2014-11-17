Yufu.UserAdapter = DS.RESTAdapter.extend({
  namespace: "api/v1"
});


Yufu.UsersRoute = Ember.Route.extend({
  current_user: (params)->
    @store.find('user', params.user_id)
})