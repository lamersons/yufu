Yufu.Profile = DS.Model.extend Yufu.FormattedTimestampMixin,
  _type: DS.attr 'string'
  email: DS.attr 'string'
  additional_email: DS.attr 'string'
  skype: DS.attr 'string'
  qq: DS.attr 'string'
  wechat: DS.attr 'string'
  next_step: DS.attr 'number'
  next_substep: DS.attr 'number'
  additional_phone: DS.attr 'string'
  additions: DS.attr 'string'
  birthday: DS.attr 'date'
  can_travel: DS.attr 'boolean'
  sex: DS.attr 'string'
  created_at: DS.attr 'date'
  passport_num: DS.attr 'string'
  passport_till: DS.attr 'date'
  passport_country: DS.attr 'string'
  needs_job_resident_permit: DS.attr 'boolean'
#  directions: has many
#  educations: has many
  first_name: DS.attr 'string'
  has_car: DS.attr 'boolean'
  has_driving_license: DS.attr 'boolean'
  last_name: DS.attr 'string'
  middle_name: DS.attr 'string'
  native_language: DS.attr 'string'
#  nearby_city: has many
#  nearby_city_with_surcharge
  needs_job_resident_permit: DS.attr 'boolean'
  phone: DS.attr 'string'
#  services: has many
  updated_at: DS.attr 'date'
  visa: DS.attr 'string'
  years_in_china: DS.attr 'number'

  # Relations
  city: DS.belongsTo 'city', async: true
  native_language: DS.belongsTo 'language', async: true
  profile_language: DS.belongsTo 'language', async: true
  services: DS.hasMany 'service', {embedded: 'always'}
  nearby_cities: DS.hasMany 'city', {async: true}
  nearby_cities_with_surcharge: DS.hasMany 'city', {async: true}
  orders: DS.hasMany('order', {async: true, polymorphic: true})

  applications: DS.hasMany 'order_application', async: true