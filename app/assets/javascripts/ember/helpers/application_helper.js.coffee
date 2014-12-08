Ember.Handlebars.registerHelper 'ts', (key) ->
  str = "<span id='#{key}' data-mercury='simple'>#{I18n.t key}</span>"
  new Ember.Handlebars.SafeString(str)

Ember.Handlebars.registerHelper 'ts2', (key) ->
  str = "<span id='#{key}' data-mercury='simple'>#{I18n.t key}</span>"
  new Ember.Handlebars.SafeString(str)

