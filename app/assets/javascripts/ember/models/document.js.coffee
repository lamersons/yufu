Yufu.Document = DS.Model.extend({
  doc: DS.attr 'string'
  name: DS.attr 'string'

  education: DS.belongsTo 'education'
})