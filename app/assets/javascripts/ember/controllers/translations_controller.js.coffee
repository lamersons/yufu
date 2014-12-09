# for more details see: http://emberjs.com/guides/controllers/

Yufu.TranslationsController = Ember.ArrayController.extend
  queryParams: ['target_locale']

  target_locale: null

  localesHandler: (->
    @transitionToRoute 'translations', queryParams: target_locale: @target_locale
  ).observes('target_locale')


