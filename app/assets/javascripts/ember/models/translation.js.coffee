# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.Translation = DS.Model.extend
  original_locale: DS.attr 'string'
  target_locale:   DS.attr 'string'
