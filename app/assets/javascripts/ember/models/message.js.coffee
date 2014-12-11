# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.Message = DS.Model.extend
  body: DS.attr 'string'

  sender:    DS.belongsTo 'user', async: true
  recipient: DS.belongsTo 'user', async: true
