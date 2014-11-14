Yufu.ProfilesEditOneController = Ember.ObjectController.extend({
  actions: {
    update: (profile)->
      profile.save().then  =>
        @transitionToRoute('edit_two')
  }
})