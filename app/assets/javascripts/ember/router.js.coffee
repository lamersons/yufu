# For more information see: http://emberjs.com/guides/routing/

Yufu.Router.map ()->
  @resource('news')
  @resource('messages')
  @resource('bookings')
  @resource('something')
  @resource('orders')
  @resource 'users', ->
    @route 'show', {path: '/:id'}
  @resource 'profiles', ->
    @route 'edit', {path: '/:id/edit'}

  @resource('balance')

