# for more details see: http://emberjs.com/guides/controllers/

Yufu.SettingsController = Ember.ObjectController.extend
  message: null

  actions:
    save: ->
      @model.save().then (=>
        @set 'message', 'Настройки успешно сохранены'
      ), (=>
        @set 'message', 'Что то пошло не так'
      )

