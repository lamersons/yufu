
Yufu.ApplicationRoute = Ember.Route.extend({
  currentUser: ->
    @store.find 'user', window.myId

  setupController: (controller, model) ->
    controller.set 'currentUser', @currentUser()
})
