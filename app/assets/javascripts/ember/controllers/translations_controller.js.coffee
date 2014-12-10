# for more details see: http://emberjs.com/guides/controllers/

Yufu.TranslationsController = Ember.ArrayController.extend
  queryParams: ['target_locale']

  target_locale: null

  preview_link: (->
    "/?locale=#{@target_locale}"
  ).property('target_locale')

  localesHandler: (->
    @transitionToRoute 'translations', queryParams: target_locale: @target_locale
  ).observes('target_locale')

  actions:
    focusOut: (translation)->
      if @target_locale && translation.changedAttributes()['value']
        translation.set 'locale', @target_locale
        translation.save()


