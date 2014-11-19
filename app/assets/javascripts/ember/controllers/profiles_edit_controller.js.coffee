Yufu.ProfilesEditController = Ember.Controller.extend({
  actions: {
    update: (profile)->
      profile.save().then =>
        @transitionTo('profiles.edit')
  }
})