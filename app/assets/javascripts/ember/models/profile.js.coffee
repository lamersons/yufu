Yufu.ProfileAdapter = DS.RESTAdapter.extend({
  namespace: 'api/v1'
});

Yufu.Profile = DS.Model.extend({

  _type: DS.attr 'string'
  additional_phone: DS.attr 'string'
  additions: DS.attr 'string'
  birthday: DS.attr 'date'
  can_travel: DS.attr 'boolean'
  sex: DS.attr 'string'
  created_at: DS.attr 'date'
  passport_num: DS.attr 'string'
  passport_till: DS.attr 'date'
  passport_country: DS.attr 'string'
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
  city: DS.belongsTo('city')
})
