Yufu.TranslatorIndividualEditRoute = Ember.Route.extend({

  lock: true
  steps: ['select_type', 'language', 'personal', 'contacts', 'services', 'education', 'payments']

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
    show_directions: {
      refreshModel: true
    }
  }

  actions: {
    queryParamsDidChange: (paramsChanged, params)->
      @render_template(params.step || @steps, params.show_nearby, params.show_nearby_with_surcharge, params.show_directions) unless @lock
  }


  model: (params)->
    @store.find('profile', params.id)

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'cities', @store.find('city')
    controller.set 'directions', @store.find('direction')
    controller.set 'languages', @store.find('language')
    controller.set 'next_step', @steps[1]
    controller.set 'steps', @steps
    controller.set 'genders', ['male', 'female']
    controller.set 'visa_kind', ['visa1', 'visa2']
    controller.set 'truefalse', [true, false]
    controller.set 'sense_of_translation', ['from chinese', 'to chinese']
    controller.set 'truefalse', [true, false]
    controller.set 'statuses', ['status_1', 'status_2']
    controller.set 'lang_levels', ['level_1', 'level_2']
    controller.set 'pay_ways', ['bank', 'visa', 'alipay']
    if model.get('services').content.length == 0
      new_service = @store.createRecord('service', {profile: model} )
      model.get('services').content.push new_service

  renderTemplate: (controller, model)->
    @lock = false
    if model.get('_type') == 'Profile::Translator::Base'
      step = @steps[0]
    else
      step = controller.step || @steps[1]
    @render_template(step, null, null)


  render_template: (step, show_nearby, show_nearby_surcharge, show_directions)->
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

    if show_directions
      @render 'partials/_directions', {outlet: 'modal'}
      return
    else
    @disconnectOutlet {outlet: 'modal'}

})