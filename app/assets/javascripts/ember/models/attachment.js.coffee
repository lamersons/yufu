# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.Attachment = DS.Model.extend
  fileName: DS.attr 'string'
  url: DS.attr 'string'
