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

  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'


  orders:   DS.hasMany 'order',   async: true

# Embedded relations don't work with STI correct
  services_attributes: DS.hasMany 'service', embedded: 'always'
