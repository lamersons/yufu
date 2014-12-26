# for more details see: http://emberjs.com/guides/controllers/

Yufu.MessagesNewController = Ember.ObjectController.extend
  queryParams: ['recipient_id']
  recipient_id: null

  actions:
    create: ->
      @model.save().then =>
        @transitionToRoute 'messages'


