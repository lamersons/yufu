# for more details see: http://emberjs.com/guides/controllers/

Yufu.StepByStepEditController = Ember.Controller.extend
  queryParams: ['step']
  next_step: (->
    @steps[(@stepIndex() || 0) + 1]
  ).property('step')

  back_step: (->
    @steps[@stepIndex() - 1]
  ).property('step')


  isNextEnable: (->
    (@stepIndex() || 0) < (@steps.length - 1)
  ).property('step')

  isBackEnable: (->
    @stepIndex() > 0
  ).property('step')
