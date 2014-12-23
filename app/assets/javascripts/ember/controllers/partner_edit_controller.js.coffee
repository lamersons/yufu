# for more details see: http://emberjs.com/guides/controllers/

Yufu.PartnerEditController = Ember.Controller.extend
  actions:
    save: ->
      @model.save()

