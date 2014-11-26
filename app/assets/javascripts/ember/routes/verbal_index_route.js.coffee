# For more information see: http://emberjs.com/guides/routing/

Yufu.VerbalIndexRoute = Yufu.ApplicationRoute.extend({
  controllerName: 'orders'
  queryParams: {
    scope: {
      refreshModel: true
    }
  }

  model: (params)->
    profile = @modelFor 'profile'
    @store.find 'order', {_type: 'Order::Verbal', profile_id: profile.id, scope: params.scope}

})
