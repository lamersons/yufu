Yufu.ProfilesIndexController = Ember.ArrayController.extend({
  actions: {
    activate: (profile, profileForReload) ->
      profile.set 'is_active', true
      profile.save().then =>
        profileForReload.set 'is_active', false
        @store.all('user').get('firstObject').reload()

  }

})
