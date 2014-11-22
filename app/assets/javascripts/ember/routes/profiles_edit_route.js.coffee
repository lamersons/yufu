Yufu.ProfilesEditRoute = Ember.Route.extend({

  queryParams: {
    step: {
      refreshModel: true
    }
    substep: {
      refreshModel: true
    }
    show_nearby_with_surcharge: {
      refreshModel: true
    }
    show_nearby: {
      refreshModel: true
    }
  }

  actions: {
    queryParamsDidChange: (paramsChanged, params)->
      @render_template(params.step || 1, params.substep || 1, params.show_nearby, params.show_nearby_with_surcharge)
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
    controller.set 'nearby_cities', model.get('nearby_cities').content
    controller.set 'nearby_cities_with_surcharge', model.get('nearby_cities_with_surcharge').content

  renderTemplate: (model, controller)->
    step = model.step || '1'
    @render_template(step, model.substep || '1', null, null)


  render_template: (step, substep, show_nearby, show_nearby_surcharge)->
    @render "profiles/edit_#{step}#{substep}"
    @render 'partials/_navigation',{outlet: 'navigation'}
    @render 'profiles/step_nav',{outlet: 'step_nav'}
    if show_nearby
      @render 'partials/_nearby_modal', {outlet: 'nearby_modal'}
    else
      @disconnectOutlet {outlet: 'nearby_modal'}
    if show_nearby_surcharge
      @render 'partials/_nearby_surcharge_modal', {outlet: 'nearby_modal_with_surcharge'}
    else
      @disconnectOutlet {outlet: 'nearby_modal_with_surcharge'}

})