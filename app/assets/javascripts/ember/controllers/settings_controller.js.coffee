# for more details see: http://emberjs.com/guides/controllers/

Yufu.SettingsController = Ember.ObjectController.extend
  actions:
    save: ->
      @model.save()

