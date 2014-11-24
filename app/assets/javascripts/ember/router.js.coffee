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

  @route 'agent', ->
    @resource 'vassals'
    @resource 'banners', ->
      @route 'show'
      @route 'new'

    @resource 'link'



  @resource('balance')

