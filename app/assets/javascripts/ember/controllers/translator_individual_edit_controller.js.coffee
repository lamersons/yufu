Yufu.TranslatorIndividualEditController = Ember.Controller.extend({
  queryParams: ['step']
  step: 'language'

  stepIndex:( ->
    parseInt @steps.indexOf(@get('step'))
  )

  next_step: (->
    @steps[(@stepIndex() || 0) + 1]
  ).property('step')

  back_step: (->
    @steps[@stepIndex() - 1]
  ).property('step')


  isNextEnable: (->
    (@stepIndex() || 0) < @steps.length
  ).property('step')

  isBackEnable: (->
    @stepIndex() > 0
  ).property('step')

  actions: {

    show_nearby_with_surcharge: ->
      @transitionToRoute 'translator_individual.edit', queryParams: {show_nearby_with_surcharge: true}

    hide_nearby_surcharge: ->
      @transitionToRoute 'translator_individual.edit', queryParams: {show_nearby_with_surcharge: false}

    show_nearby: ->
      @transitionToRoute 'translator_individual.edit', queryParams: {show_nearby: true}

    hide_nearby: ->
      @transitionToRoute 'translator_individual.edit', queryParams: {show_nearby: false}

    update: (profile, step)->
      profile.save().then =>
        @transitionToRoute 'translator_individual.edit', queryParams: {step: step}
  }
})