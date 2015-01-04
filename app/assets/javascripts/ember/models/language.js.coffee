Yufu.Language = DS.Model.extend({
  name:       DS.attr 'string'
  short_name: DS.attr 'string'

  services: DS.hasMany 'services', async: true
  profiles: DS.hasMany 'profile', {async: true, inverse: 'native_language'}
  profiles: DS.hasMany 'profile', {async: true, inverse: 'profile_language'}


})