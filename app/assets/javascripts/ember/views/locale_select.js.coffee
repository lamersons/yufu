Yufu.LocaleSelect = Ember.Select.extend
  change: ->
    locale = @selection.get('name')
    window.location.href = window.location.href.replace(/locale=.*?#/, "locale=#{locale}#")