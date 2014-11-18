Yufu.CitiesIndexRoute = Ember.Route.extend({
  model: ->
    @store.findAll('city')
})