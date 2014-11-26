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
    @get('controllers.application.currentRouteName')
  ).property()

  actions: {
    assign_as: (order, status) ->
      profile_id = @get('controllers.application.currentUser').get('translator_profile_id')
      record = @store.find('order_application', {profile_id: profile_id, order_id_eq: order.id}).then (items) ->
        record = items.get('firstObject')
        if record == null
          record = @store.createRecord 'order_application', {
            order: order
            status: status
            profile_id: profile_id
          }
        else
          record.set 'status', status
          record.set 'profile_id', profile_id
        record.save().then ->
          order.reload()
          order.set 'application_status', status
  }
})

Yufu.VerbalIndexController = Yufu.OrdersController.extend()