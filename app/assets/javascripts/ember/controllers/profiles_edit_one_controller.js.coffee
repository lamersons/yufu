Yufu.ProfilesEditOneController = Ember.ObjectController.extend({
  actions: {
    update: (profile)->
      profile.set 'name', @get('name')
      profile.save().then  =>
        @transitionToRoute('edit_two')
  }
})