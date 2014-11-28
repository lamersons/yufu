# For more information see: http://emberjs.com/guides/routing/

Yufu.PartnersClientsRoute = Ember.Route.extend({
  model: ->
    profile = @modelFor 'profile'
    @store.find 'partners_client', profile_id: profile.id

  setupController: (controller, model)->
    controller.set 'model', model
    controller.set 'currentProfile', @modelFor('profile')

})
