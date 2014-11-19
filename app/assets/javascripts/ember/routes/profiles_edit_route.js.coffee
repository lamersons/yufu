Yufu.ProfilesEditRoute = Ember.Route.extend({

  queryParams: {
    step: {
      refreshModel: true
    }
  }

  model: (params)->
    @store.find('profile', params.id)

  setupController: (controller, model) ->
    controller.set 'cities', @store.find('city')
    controller.set 'model', model

  renderTemplate: (model, controller)->
    step = model.step || '1'
    @render "profiles/edit_#{step}"
    @render 'partials/registration',{outlet: 'navigation'}
    @render 'profiles/step_nav',{outlet: 'step_nav'}

})