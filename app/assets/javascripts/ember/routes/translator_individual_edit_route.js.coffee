Yufu.TranslatorIndividualEditRoute = Ember.Route.extend({

  lock: true
  steps: ['language', 'personal', 'contacts', 'services', 'education', 'payments']

  queryParams: {
    step: {
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
      @render_template(params.step || @steps[0], params.show_nearby, params.show_nearby_with_surcharge) unless @lock
  }


  model: (params)->
    @store.find('profile', params.id)

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'cities', @store.find('city')
    controller.set 'languages', @store.find('language')
    controller.set 'steps', @steps
    controller.set 'genders', ['male', 'female']
    controller.set 'visa_kind', ['visa1', 'visa2']
    controller.set 'yesno', ['yes', 'no']
    controller.set 'truefalse', [true, false]
    controller.set 'lang_levels', ['level_1', 'level_2']
    new_service = @store.createRecord('service', {profile: model} )
    model.get('services_attributes').content.push new_service
    controller.set 'new_service', new_service

  renderTemplate: (controller, model)->
    @lock = false
    if model.get('_type') == 'Profile::Translator::Base'
      step = @steps[0]
    else
      step = controller.step || @steps[1]
    @render_template(step, null, null)


  render_template: (step, show_nearby, show_nearby_surcharge)->
    @render()
    @render "translator_individual/edit_#{step}", {into: 'translator_individual/edit'}
    if show_nearby
      @render 'partials/_nearby_modal', {outlet: 'modal'}
      return
    else
      @disconnectOutlet {outlet: 'modal'}
    if show_nearby_surcharge
      @render 'partials/_nearby_surcharge_modal', {outlet: 'modal'}
      return
    else
      @disconnectOutlet {outlet: 'modal'}

})