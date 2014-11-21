Yufu.CitiesEditView = Ember.View.extend
  nearbyCheckbox: Ember.Checkbox.extend()
#    checkedObserver: ( ->
#      towns = @get 'profile.towns'
#      if @get 'checked'
#        towns.addObject @get 'town'
#      else
#        towns.removeObject @get 'town'
#      @get('controller.store').commit()
#    ).observes 'checked'