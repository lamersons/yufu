# For more information see: http://emberjs.com/guides/routing/

Yufu.BannersNewRoute = Ember.Route.extend({
  model: ->
    @store.createRecord 'banner'
})
