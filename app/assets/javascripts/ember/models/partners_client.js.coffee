# for more details see: http://emberjs.com/guides/models/defining-models/

Yufu.PartnersClient = DS.Model.extend
  first_name: DS.attr 'string'
  last_name: DS.attr 'string'
  middle_name: DS.attr 'string'
  orders_count: DS.attr 'string'

  profile_id: DS.attr 'string', {serialize: false}
