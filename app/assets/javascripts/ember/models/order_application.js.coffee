# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.OrderApplication = DS.Model.extend {
  status: DS.attr 'string'
  profile_id: DS.attr 'string', {serialize: false}

  order:    DS.belongsTo 'order', async: true
  assignee: DS.belongsTo 'profile', async: true

}