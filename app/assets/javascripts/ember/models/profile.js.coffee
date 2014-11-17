Yufu.ProfileAdapter = DS.RESTAdapter.extend({
  namespace: "api/v1"
});

Yufu.Profile = DS.Model.extend({
  user: DS.belongsTo('user'),
  sex: DS.attr 'string'
})
