# For more information see: http://emberjs.com/guides/routing/

Yufu.VassalsRoute = Ember.Route.extend({
  model: ->
    @store.find 'user', {q: {overlord_id_eq: window.myId}}

  setupController: (controller, model) ->
    controller.set 'model', model
})
