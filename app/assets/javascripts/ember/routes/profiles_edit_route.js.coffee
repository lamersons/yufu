Yufu.ProfilesEditRoute = Ember.Route.extend({

  queryParams: {
    step: {
      refreshModel: true
    }
    substep: {
      refreshModel: true
    }
  }

  actions: {
    queryParamsDidChange: (paramsChanged, params)->
#      @reset()
      if paramsChanged.step || paramsChanged.substep
        @render_template(params.step || 1, params.substep || 1)
  }


  model: (params)->
    @store.find('profile', params.id)

  setupController: (controller, model) ->
    controller.set 'cities', @store.find('city')
    controller.set 'model', model
    controller.set 'languages', @store.find('language')
    controller.set 'next_step', '1'
    controller.set 'next_substep', '0'
    controller.set 'genders', ['male', 'female']
    controller.set 'visa_kind', ['visa1', 'visa2']

  renderTemplate: (model, controller)->
    step = model.step || '1'
    @render_template(step, model.substep || '1')


  render_template: (step, substep)->
    @render "profiles/edit_#{step}#{substep}"
    @render 'profiles/step_nav',{outlet: 'step_nav'}

})