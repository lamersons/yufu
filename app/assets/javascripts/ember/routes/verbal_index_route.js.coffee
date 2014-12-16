# For more information see: http://emberjs.com/guides/routing/

Yufu.VerbalIndexRoute = Yufu.ApplicationRoute.extend({
  controllerName: 'orders'
  queryParams:
    scope:
      refreshModel: true
    location:
      refreshModel: true
    language:
      refreshModel: true
    client:
      refreshModel: true


  model: (params)->
    profile = @modelFor 'profile'
    q = {}
    q.language_id_eq = params.language if params.language?
    q.location_id_eq = params.location if params.location?
    q.partners_client_id_eq = params.client if params.client?
    @store.find 'order', {_type: 'Order::Verbal', profile_id: profile.id, scope: params.scope, q: q}

  setupController: (controller, model) ->
    controller.set 'model',     model
    controller.set 'cities',    @store.find 'city'
    controller.set 'languages', @store.find 'language'
    controller.set 'profile',   @modelFor 'profile'
})
