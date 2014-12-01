Yufu.City = DS.Model.extend({
  name: DS.attr 'string'

  profiles: DS.hasMany 'profile', {inverse: 'nearby_cities', async: true}
  profiles: DS.hasMany 'profile', {inverse: 'nearby_city_with_surcharge', async: true}
})