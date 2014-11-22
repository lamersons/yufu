Yufu.City = DS.Model.extend({
  name: DS.attr 'string'

  profiles: DS.hasMany 'profile', {inverse: 'nearby_city'}
})