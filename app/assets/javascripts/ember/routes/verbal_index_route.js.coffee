# For more information see: http://emberjs.com/guides/routing/

Yufu.VerbalIndexRoute = Yufu.ApplicationRoute.extend({
  controllerName: 'orders'
  queryParams: {
    scope: {
      refreshModel: true
    }
    location: {
      refreshModel: true
    }
    language: {
      refreshModel: true
    }
  }

  model: (params)->
    profile = @modelFor 'profile'
    q = {}
    q.language_id_eq = params.language if params.language != null
    q.location_id_eq = params.location if params.location != null
    @store.find 'order', {_type: 'Order::Verbal', profile_id: profile.id, scope: params.scope, q: q}

  setupController: (controller, model) ->
    controller.set 'model',     model
    controller.set 'cities',    @store.find 'city'
    controller.set 'languages', @store.find 'language'
})
