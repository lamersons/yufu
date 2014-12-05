# for more details see: http://emberjs.com/guides/controllers/

Yufu.BannersNewController = Ember.ObjectController.extend({
  actions: {
    create: ->
      @model.save().then (=>
        @transitionToRoute 'banners'
      ), (=>
        $('.error').show()
      )
  }
})

