Yufu.ProfilesEditController = Ember.Controller.extend({
  queryParams: ['step', 'substep']
  next_step: '1'
  next_substep: '1'
  step_class: (step)->
    if step == @next_step
      return 'active'

  actions: {
    update: (profile, step, substep)->
      step = parseInt(step)
      if step <= 1
        step += 1
      if step == 2
        substep = parseInt(substep)
        if substep < 6
          substep += 1
        else
          substep = 1
          step+=1
      @next_step = step
      @next_substep = substep

      profile.save().then =>
        @transitionToRoute 'profiles.edit', queryParams: {step: step, substep: substep}
  }
})