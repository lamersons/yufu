# For more information see: http://emberjs.com/guides/routing/

Yufu.TranslationsRoute = Ember.Route.extend
  model: ->
    @store.find 'translation'

  setupController: (controller, model) ->
    controller.set 'model', model