# For more information see: http://emberjs.com/guides/routing/

Yufu.MessagesIndexRoute = Ember.Route.extend

  queryParams:
    scope:
      refreshModel: true


  model: (params) ->
    @store.find 'message', scope: params.scope


