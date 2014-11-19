# For more information see: http://emberjs.com/guides/routing/

Yufu.LinkRoute = Ember.Route.extend({
  model: ->
    @store.find 'user', window.myId
})
