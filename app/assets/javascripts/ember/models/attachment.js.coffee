# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.Attachment = DS.Model.extend
  file: DS.attr 'string'
  fileName: DS.attr 'string'
  url: DS.attr 'string'
  message: DS.belongsTo 'message'

