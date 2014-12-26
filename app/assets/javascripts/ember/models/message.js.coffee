# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.Message = DS.Model.extend
  body: DS.attr 'string'
  from_backoffice: DS.attr 'boolean'

  sender:    DS.belongsTo 'user', async: true
  recipient: DS.belongsTo 'user', async: true

  attachments: DS.hasMany 'attachment', embedded: 'always'
