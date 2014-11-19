Yufu.ProfilesEditRoute = Ember.Route.extend({


  model: (params)->
    @store.find('profile', params.id)

  setupController: (controller, model) ->
    controller.set 'cities', @store.find('city')
    controller.set 'model', model

})