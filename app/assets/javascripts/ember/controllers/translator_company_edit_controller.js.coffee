Yufu.TranslatorCompanyEditController = Yufu.StepByStepEditController.extend
  step: 0

  stepIndex:( ->
    @get('step')
  )

  actions: {
    update: (profile, step)->
      profile.save().then =>
        @transitionToRoute 'translator_company.edit', queryParams: {step: step}
  }
