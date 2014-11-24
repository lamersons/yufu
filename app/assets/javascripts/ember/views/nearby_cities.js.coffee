Yufu.nearbyCheckbox = Ember.Checkbox.extend

  on_init: (->
    curr_city = @get 'city'
    profile = @get 'profile'
    for city in profile.model.get('nearby_cities').content.content
      if curr_city == city
        @set('checked', true)
  ).on('init')
  checkedObserver: ( ->
    cities = @get 'profile.cities'
    profile = @get 'profile'
    if @get 'checked'
      profile.model.get('nearby_cities').addObject(this.get('city'))
    else
      profile.model.get('nearby_cities').removeObject(this.get('city'))
  ).observes 'checked'