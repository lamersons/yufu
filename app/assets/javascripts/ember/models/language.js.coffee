Yufu.Language = DS.Model.extend({
  name: DS.attr 'string'

  services: DS.hasMany 'services', async: true
})