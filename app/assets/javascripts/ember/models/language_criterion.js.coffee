# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.LanguageCriterion = DS.Model.extend
  level: DS.attr 'string'

  language: DS.belongsTo 'language', async: true

