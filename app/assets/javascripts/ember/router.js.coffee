# For more information see: http://emberjs.com/guides/routing/

Yufu.Router.map ()->
  @resource('news')
  @resource('bookings')
  @resource('something')
  @resource 'messages', ->
    @route 'new'

  @resource 'users', ->
    @route 'show', {path: '/:id'}

  @resource 'profiles', ->
    @route 'translator_new'
    @resource 'client', ->
      @route 'edit', {path: '/:id/edit'}
    @resource 'partner', ->
      @route 'edit', {path: '/:id/edit'}
    @resource 'translator_company', ->
      @route 'edit', {path: '/:id/edit'}
    @resource 'translator_individual', ->
      @route 'edit', {path: '/:id/edit'}

  @resource 'profile', {path: '/profile/:id'}, ->
    @resource 'orders', ->
      @resource 'verbal', ->
        @route 'show', {path: '/:id'}
      @resource 'written'
      @resource 'expert'

    @resource 'partners_clients'

  @resource 'translations'

  @route 'agent', ->
    @resource 'vassals'
    @resource 'banners', ->
      @route 'show'
      @route 'new'

    @resource 'link'



  @resource('balance')

