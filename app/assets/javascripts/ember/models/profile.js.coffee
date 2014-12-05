Yufu.ProfileAdapter = Yufu.ApplicationAdapter.extend
  pathForType: (type) ->
    'profiles'

Yufu.Profile = DS.Model.extend Yufu.FormattedTimestampMixin,
  _type:            DS.attr 'string'
  type:             DS.attr 'string'
  email:            DS.attr 'string'
  phone:            DS.attr 'string'
  additional_phone: DS.attr 'string'
  first_name:       DS.attr 'string'
  last_name:        DS.attr 'string'
  middle_name:      DS.attr 'string'
  status:           DS.attr 'string'
  pay_way:          DS.attr 'string'
  total_approve:    DS.attr 'boolean'

  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'


  orders:   DS.hasMany 'order'

# Embedded relations don't work with STI correct
  educations:       DS.hasMany 'education',           embedded: 'always'
  native_language:  DS.belongsTo 'language',          async: true
  profile_language: DS.belongsTo 'language',          async: true
  city:             DS.belongsTo 'city',              async: true
  services:         DS.hasMany 'service',             embedded: 'always'


