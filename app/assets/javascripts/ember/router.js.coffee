# For more information see: http://emberjs.com/guides/routing/

Yufu.Router.map ()->
  @resource('news')
  @resource('messages')
  @resource('bookings')
  @resource('something')
  @resource('orders')
  @resource 'user', ->
    @resource 'profiles', ->
      @route 'edit_one', {path: ':id/edit_one'}
      @route 'edit_two', {path: ':id/edit_two'}

  @resource('balance')

