# For more information see: http://emberjs.com/guides/routing/

Yufu.Router.map ()->
  @resource('news')
  @resource('messages')
  @resource('bookings')
  @resource('something')

  @resource 'users', ->
    @route 'show', {path: '/:id'}
  @resource 'profiles', ->
    @route 'translator_new'
    @route 'edit', {path: '/:id/edit'}
    @resource 'translator_company', ->
      @route 'edit', {path: '/:id/edit'}
  @resource 'profile', {path: '/profile/:id'}, ->
    @resource 'orders', ->
      @resource 'verbal', ->
        @route 'show', {path: '/:id'}
      @resource 'written'
      @resource 'expert'

    @resource 'partners_clients'

  @route 'agent', ->
    @resource 'vassals'
    @resource 'banners', ->
      @route 'show'
      @route 'new'

    @resource 'link'



  @resource('balance')

