Yufu.ProfilesEditController = Ember.Controller.extend({
  actions: {
    update: (profile)->
      profile.set('city', @get('city'))
      profile.save().then =>
        @transitionTo('profiles.edit')
  }
})