Yufu.Service = DS.Model.extend({
  level: DS.attr 'string'
  has_hsk: DS.attr 'boolean'
  verbal_price: DS.attr 'number'
  written_price: DS.attr 'number'
  written_translate_type: DS.attr 'string'

  profile: DS.belongsTo 'profile'
})