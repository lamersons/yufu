# for more details see: http://emberjs.com/guides/controllers/

Yufu.TranslatorNewController = Ember.Controller.extend({
  actions: {
    create: ->
      console.log @get('_type')
  }
})

