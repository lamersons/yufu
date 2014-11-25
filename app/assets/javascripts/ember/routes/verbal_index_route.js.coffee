# For more information see: http://emberjs.com/guides/routing/

Yufu.VerbalIndexRoute = Yufu.ApplicationRoute.extend({
  model: ->
    profile = @modelFor 'profile'
    @store.find 'order', {_type: 'Order::Verbal', profile_id: profile.id}
})
