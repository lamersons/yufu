# for more details see: http://emberjs.com/guides/models/defining-models/
Yufu.ProfileTranslatorCompanyAdapter = Yufu.ProfileAdapter.extend()

Yufu.ProfileTranslatorCompany = Yufu.Profile.extend
  company_uid:       DS.attr 'string'
  name:              DS.attr 'string'
  location:          DS.attr 'string'
  address:           DS.attr 'string'
  years_in_business: DS.attr 'number'
  service_phone:     DS.attr 'string'
  contacts_person:   DS.attr 'string'
  additional_email:  DS.attr 'string'
  skype:             DS.attr 'string'
  qq:                DS.attr 'string'
