Ember.Handlebars.registerHelper 'ts', (key) ->
  str = I18n.t(key).replace /^"(.*)"$/, '$1'
  escaped = Handlebars.Utils.escapeExpression str
  new Ember.Handlebars.SafeString "<span id='#{key}' data-mercury='simple'>#{escaped}</span>"

Ember.Handlebars.registerHelper 'ts2', (key) ->
  str = "<span id='#{key}' data-mercury='simple'>#{I18n.t key}</span>"
  new Ember.Handlebars.SafeString(str)

