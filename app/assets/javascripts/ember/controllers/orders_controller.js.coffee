# for more details see: http://emberjs.com/guides/controllers/

Yufu.OrdersController = Ember.ArrayController.extend({
  needs: ['application']

  queryParams: ['scope']
  scope: 'open'

  currentRoute: (->
    this.get('controllers.application.currentRouteName');
  ).property()

  actions: {
    assign_as: (order, status) ->
      record = @store.createRecord 'order_application', {
        order: order
        status: status
        profile_id: this.currentUser.get('translator_profile_id')
      }
      record.save().then ->
        order.reload()
        order.set 'application_status', status
  }
})

Yufu.VerbalIndexController = Yufu.OrdersController.extend()