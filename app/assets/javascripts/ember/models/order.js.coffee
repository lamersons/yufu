Yufu.OrderAdapter = Yufu.ApplicationAdapter.extend
  pathForType: (type) ->
    'orders'

Yufu.Order = DS.Model.extend {
  state: DS.attr 'string'
  application_status: DS.attr 'string'

  hasPrimaryApplication: (->
    @get('application_status') == 'primary'
  ).property('application_status')

  hasSecondaryApplication: (->
    @get('application_status') == 'secondary'
  ).property('application_status')

  canCreateSecondaryApp: (->
    @get('application_status') != 'primary'
  ).property('application_status')
}
