# for more details see: http://emberjs.com/guides/controllers/

Yufu.PartnersClientsController = Ember.ArrayController.extend({
  actions: {
    create: ->
      partners_client = @store.createRecord 'partners_client', {
        first_name:  @get('first_name')
        last_name:   @get('last_name')
        middle_name: @get('middle_name')
        profile_id:  @get('currentProfile').id
      }
      partners_client.save().then (=>
        @get('model').pushObject partners_client
      ), (=>
        $('.error').show()
      )
  }
})

