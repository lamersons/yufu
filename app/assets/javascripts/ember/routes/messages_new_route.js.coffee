# For more information see: http://emberjs.com/guides/routing/

Yufu.MessagesNewRoute = Ember.Route.extend
  queryParams:
    recipient_id:
      refreshModel: true

  model: (params)->
    if params.recipient_id
      @store.find('user', params.recipient_id).then (recipient) =>
        return @store.createRecord 'message', recipient: recipient
    else
      @store.createRecord 'message'

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'users', @store.find('user')
