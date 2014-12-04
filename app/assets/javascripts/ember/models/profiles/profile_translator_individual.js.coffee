Yufu.ProfileTranslatorIndividualAdapter = Yufu.ProfileAdapter.extend()

Yufu.ProfileTranslatorIndividual = Yufu.Profile.extend
  type:             DS.attr 'string'
  additional_email: DS.attr 'string'
  skype:            DS.attr 'string'
  qq:               DS.attr 'string'
  wechat:           DS.attr 'string'
  next_step:        DS.attr 'number'
  additions:        DS.attr 'string'
  birthday:         DS.attr 'string'
  can_travel:       DS.attr 'boolean'
  sex:              DS.attr 'string'
  is_active:        DS.attr 'boolean'

  passport_num:              DS.attr 'string'
  passport_till:             DS.attr 'date'
  passport_country:          DS.attr 'string'
  needs_job_resident_permit: DS.attr 'boolean'

  has_car:                   DS.attr 'boolean'
  has_driving_license:       DS.attr 'boolean'

  needs_job_resident_permit: DS.attr 'boolean'
  visa:                      DS.attr 'string'
  visa_till:                 DS.attr 'date'
  years_in_china:            DS.attr 'number'

# Relations
  city:             DS.belongsTo 'city',              async: true
  native_language:  DS.belongsTo 'language',          async: true
  profile_language: DS.belongsTo 'language',          async: true
  applications:     DS.hasMany   'order_application', async: true
  nearby_cities:    DS.hasMany   'city',              async: true
  nearby_cities_with_surcharge: DS.hasMany 'city',    async: true
  directions:       DS.hasMany 'direction',           async: true

  formattedVisaTill: ((key, value, previousValu) ->
    if (arguments.length > 1)
      @set 'visa_till', moment(value, format).toDate()
    date = @.get 'visa_till'
    format = @.get 'format'
    moment(date).format format
  ).property('visa_till', 'format')

  formattedPassportTill: ((key, value, previousValu) ->
    format = @.get 'format'
    if (arguments.length > 1)
      @set 'passport_till', moment(value, format).toDate()
    date = @.get 'passport_till'
    moment(date).format format
  ).property('passport_till', 'format')

  formattedBirthday: ((key, value, previousValu) ->
    if (arguments.length > 1)
      @set 'birthday', moment(value, format).toDate()
    date = @.get 'birthday'
    format = @.get 'format'
    moment(date).format format
  ).property('birthday', 'format')