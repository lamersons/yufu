# for more details see: http://emberjs.com/guides/controllers/

Yufu.BannersNewController = Ember.Controller.extend({
  actions: {
    create: ->
      attributes = {
        name:   @get('name')
        width:  @get('width')
        height: @get('height')
      }
      banner = @store.createRecord 'banner', attributes
      banner.save().then (=>
        @transitionToRoute 'banners'
      ), (=>
        $('.error').show()
      )
  }
})

