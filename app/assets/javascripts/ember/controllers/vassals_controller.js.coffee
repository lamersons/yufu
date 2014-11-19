# for more details see: http://emberjs.com/guides/controllers/

Yufu.VassalsController = Ember.ArrayController.extend({
  actions: {
    create: ->
      vassal = @store.createRecord 'user', {email: @get('email'), overlord_id: window.myId}
      vassal.save().then (=>
        @get('model').pushObject vassal
      ), (=>
        $('.error').show()
      )
  }
})

