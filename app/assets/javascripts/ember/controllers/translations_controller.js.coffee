Yufu.TranslationsController = Ember.ArrayController.extend
  queryParams: ['target_locale']
  filter: ''
  target_locale: null

  filteredContent: (->
    filter = @get 'filter'
    rx = new RegExp filter, 'gi'
    translations = @get 'arrangedContent'
    translations.filter (translation)->
      translation.get('original').match(rx)
  ).property('arrangedContent', 'filter')

  preview_link: (->
    "/?locale=#{@target_locale}"
  ).property('target_locale')

  localesHandler: (->
    @transitionToRoute 'translations', queryParams: target_locale: @target_locale
  ).observes('target_locale')

