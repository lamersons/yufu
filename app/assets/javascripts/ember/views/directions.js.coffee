Yufu.directionsCheckbox = Ember.Checkbox.extend

  on_init: (->
    curr_direction = @get 'direction'
    profile = @get 'profile'
    for direction in profile.model.get('directions').content.content
      if curr_direction == direction
        @set('checked', true)
  ).on('init')
  checkedObserver: ( ->
    directions = @get 'profile.directions'
    profile = @get 'profile'
    if @get 'checked'
      profile.model.get('directions').addObject(this.get('direction'))
    else
      profile.model.get('directions').removeObject(this.get('direction'))
  ).observes 'checked'