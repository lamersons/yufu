# For more information see: http://emberjs.com/guides/routing/

Yufu.ProfilesIndexRoute = Ember.Route.extend({
  model: ->
    @store.find('profile')

#  afterModel: (profiles, transition)->
#    @transitionTo('profiles.edit', profiles.get('firstObject'))

})
