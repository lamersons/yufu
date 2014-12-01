# For more information see: http://emberjs.com/guides/routing/

Yufu.ProfilesIndexRoute = Ember.Route.extend({

  model: ->
    @store.find 'profile'

  setupController: (controller) ->
    controller.set 'translatorIndividual', @store.all('profile_translator_individual').get('firstObject')
    controller.set 'translatorBase',       @store.all('profile_translator_base').get('firstObject')
    controller.set 'translatorCompany',    @store.all('profile_translator_company').get('firstObject')

})
