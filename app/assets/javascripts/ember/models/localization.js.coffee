# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.Localization = DS.Model.extend
  name: DS.attr 'string'
  language_name: DS.attr 'string'
  enable: DS.attr 'boolean'
