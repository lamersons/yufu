Ember.Handlebars.helper 'ts', (key) ->
  str = "<span id='#{key}' data-mercury='simple'>#{I18n.t key}</span>"
  new Ember.Handlebars.SafeString(str)

