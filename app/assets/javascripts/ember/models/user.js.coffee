Yufu.User = DS.Model.extend
  email:       DS.attr 'string'
  overlord_id: DS.attr 'string'
  translator_profile_id: DS.attr 'string'
  partner_profile_id:    DS.attr 'string'

  is_translator: DS.attr 'boolean'
  is_client:     DS.attr 'boolean'
  is_partner:    DS.attr 'boolean'

