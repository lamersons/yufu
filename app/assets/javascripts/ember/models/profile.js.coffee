Yufu.ProfileAdapter = DS.RESTAdapter.extend({
  namespace: 'api/v1'
  url: '/users/:user.id/profiles/:id'
});

Yufu.Profile = DS.Model.extend({
  user: DS.belongsTo('user'),
  sex: DS.attr 'string'

})
