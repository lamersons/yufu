Yufu.ProfilesIndexController = Ember.ArrayController.extend({
  actions: {
    edit: (profile)->
      @transitionToRoute 'profiles.edit', profile

  }

})
