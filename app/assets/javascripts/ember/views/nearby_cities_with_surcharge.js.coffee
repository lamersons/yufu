Yufu.nearbySurchargeCheckbox = Ember.Checkbox.extend

  on_init: (->
    curr_city = @get 'city'
    profile = @get 'profile'
    for city in profile.model.get('nearby_city_with_surcharge').content.content
      if curr_city == city
        @set('checked', true)
  ).on('init')
  checkedObserver: ( ->
    cities = @get 'profile.cities'
    profile = @get 'profile'
    if @get 'checked'
      profile.model.get('nearby_city_with_surcharge').addObject(this.get('city'))
    else
      profile.model.get('nearby_city_with_surcharge').removeObject(this.get('city'))
  ).observes 'checked'