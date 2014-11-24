# For more information see: http://emberjs.com/guides/routing/

Yufu.VerbalIndexRoute = Ember.Route.extend({
  model: ->
    @store.find 'order', {_type: 'Order::Verbal'}
})
