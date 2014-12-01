Yufu.ProfileTranslatorCompanyEditController = Ember.Controller.extend({
  queryParams: ['step']
  step: 0

  next_step: (->
    (@get('step') || 0) + 1
  ).property('step')

  back_step: (->
    @get('step') - 1
  ).property('step')

  step_class: (step)->
    if step == @next_step
      return 'active'

  isNextEnable: (->
    (@get('step') || 0) < @steps.length
  ).property('step')

  isBackEnable: (->
    @get('step') > 1
  ).property('step')

  actions: {
    update: (profile, step)->
      profile.save().then =>
        @transitionToRoute 'profile_translator_company.edit', queryParams: {step: step}
  }
})