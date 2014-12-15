# for more details see: http://emberjs.com/guides/controllers/

Yufu.ClientEditController = Ember.ObjectController.extend
  actions:
    save: ->
      @model.save()