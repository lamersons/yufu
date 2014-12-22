# for more details see: http://emberjs.com/guides/controllers/

Yufu.MessagesIndexController = Ember.ArrayController.extend({
  queryParams: ['scope']
  scope: 'inbox'

  actions:
    toggleBody: (message) ->
      $('.description#' + message.id).toggleClass 'min'
      
})

