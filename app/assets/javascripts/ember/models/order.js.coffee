Yufu.OrderAdapter = Yufu.ApplicationAdapter.extend
  pathForType: (type) ->
    'orders'

Yufu.Order = DS.Model.extend {
  state: DS.attr 'string'
}
