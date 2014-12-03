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

    show_directions: ->
      @transitionToRoute 'translator_individual.edit', queryParams: {show_directions: true}

    hide_directions: ->
      @transitionToRoute 'translator_individual.edit', queryParams: {show_directions: false}

    add_language: (profile)->
      new_service = @store.createRecord('service', {profile: profile} )
      profile.get('services').content.push new_service
      @transitionToRoute 'translator_individual.edit'

    add_education: (profile)->
      new_ed = @store.createRecord('education', {profile: profile} )
      profile.get('educations').content.push new_ed
      @transitionToRoute 'translator_individual.edit'

    if_other: (selection, object)->
      if selection == 'other'
        @set 'disabled_binding', false
        @transitionToRoute 'translator_individual.edit', queryParams: {update: true}
        object.set('grade', '')
      else
        @set 'disabled_binding', true
        object.set('grade', selection)

    update: (profile, step)->
      profile.save().then =>
        @transitionToRoute 'translator_individual.edit', queryParams: {step: step}
  }
