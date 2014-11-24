# For more information see: http://emberjs.com/guides/routing/

Yufu.LinkRoute = Ember.Route.extend({
  setupController: (controller) ->
    controller.set 'link', "http//dev.yufu.net/?ref=#{window.myId}"
})
