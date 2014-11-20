# For more information see: http://emberjs.com/guides/routing/

Yufu.BannersRoute = Ember.Route.extend({

})

Yufu.BannersIndexRoute = Ember.Route.extend({
  model: ->
    @store.find('banner')
})