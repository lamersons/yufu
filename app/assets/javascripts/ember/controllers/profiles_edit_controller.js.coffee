Yufu.ProfilesEditController = Ember.Controller.extend({
  queryParams: ['step']
  actions: {
    update: (profile)->
      profile.save().then =>
        @transitionTo('profiles.edit')
  }
})