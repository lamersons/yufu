# for more details see: http://emberjs.com/guides/controllers/

Yufu.ProfilesTranslatorNewController = Ember.Controller.extend
  actions: {
    create: ->
      type = @get('_type')
      if type == 'Profile::Translator::Individual'
        @redirectOrCreat(type, @translatorIndividual, 'translator_individual.edit')
      else if type == 'Profile::Translator::Company'
        @redirectOrCreat(type, @translatorCompany, 'translator_company.edit')


  }
  currentLocale: ( ->
    @store.all('localization').filterBy('name', I18n.locale).get('firstObject')
  ).property()

  redirectOrCreat: (type, profile, route) ->
    if profile
      @transitionToRoute route, profile
    else
      @updateOrCreate(type, @translatorBase, route)

  updateOrCreate: (type, profile, route) ->
    if profile
      profile.set '_type', type
      profile.set 'is_active', true
    else
      profile = @store.createRecord 'profile', {_type: type, is_active: true}
    profile.save().then =>
      profile.unloadRecord()
      @transitionToRoute route, profile.id

