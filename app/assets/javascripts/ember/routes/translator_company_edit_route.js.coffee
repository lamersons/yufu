# For more information see: http://emberjs.com/guides/routing/

Yufu.TranslatorCompanyEditRoute = Ember.Route.extend({

  lock: true
  steps: ['0', '1', '2']

  queryParams: {
    step: {
      refreshModel: true
    }
  }

  model: (params)->
    @store.find('profile', params.id)

  actions: {
    queryParamsDidChange: (paramsChanged, params)->
      @render_template(params.step) unless @lock
  }

  renderTemplate: (controller, model)->
    @lock = false
    step = controller.step || @steps[0]
    @render_template(step)


  render_template: (step)->
    @render()
    @render "translator_company/edit_#{step}", {into: 'translator_company/edit'}

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'steps', @steps

})
