Yufu.Direction = DS.Model.extend({
  name: DS.attr 'string'

  profiles: DS.hasMany 'profile', async: true
})