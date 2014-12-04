Yufu.City = DS.Model.extend({
  name: DS.attr 'string'

  profiles: DS.hasMany 'profile', {async: true}
  profiles: DS.hasMany 'profile_translator_individual', {inverse: 'nearby_cities', async: true}
  profiles: DS.hasMany 'profile_translator_individual', {inverse: 'nearby_cities_with_surcharge', async: true}
})