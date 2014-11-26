# for more details see: http://emberjs.com/guides/controllers/

Yufu.OrdersController = Ember.ArrayController.extend({
  needs: ['application']

  queryParams: ['scope', 'location', 'langauge']
  scope: 'open'

  location: null
  language: null

  filtersHangler: (->
    q = {}
    q.location = @get('location') if @get('location') != null
    q.language = @get('language') if @get('language') != null
    @transitionToRoute @currentRoute, queryParams: q
  ).observes('location', 'language')



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