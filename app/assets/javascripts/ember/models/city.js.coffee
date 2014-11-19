Yufu.CityAdapter = DS.RESTAdapter.extend({
  namespace: 'api/v1'
});

Yufu.City = DS.Model.extend({
  name: DS.attr 'string'
})