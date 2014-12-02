Yufu.TranslatorIndividualEditController = Yufu.StepByStepEditController.extend

  step: 'language'

  stepIndex:( ->
    parseInt @steps.indexOf(@get('step'))
  )


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
