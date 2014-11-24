Yufu.ProfilesEditController = Ember.Controller.extend({
  queryParams: ['step']
  next_step: ->
    @steps[1]
  step_class: (step)->
    if step == @next_step
      return 'active'

  actions: {

    show_nearby_with_surcharge: ->
      @transitionToRoute 'profiles.edit', queryParams: {show_nearby_with_surcharge: true}

    hide_nearby_surcharge: ->
      @transitionToRoute 'profiles.edit', queryParams: {show_nearby_with_surcharge: false}

    show_nearby: ->
      @transitionToRoute 'profiles.edit', queryParams: {show_nearby: true}

    hide_nearby: ->
      @transitionToRoute 'profiles.edit', queryParams: {show_nearby: false}

    update: (profile, step)->
      step_index = parseInt(@steps.indexOf(step)) + 1
      step = @steps[step_index]
      @next_step = step

      profile.save().then =>
        @transitionToRoute 'profiles.edit', queryParams: {step: step}
  }
})