# For more information see: http://emberjs.com/guides/routing/

Yufu.TranslationsRoute = Ember.Route.extend
  queryParams:
    target_locale:
      refreshModel: true


  model: (params) ->
    @store.find 'translation', target_locale: params.target_locale

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'currentUser', @store.find('user', window.myId)