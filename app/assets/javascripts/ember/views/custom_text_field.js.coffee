Yufu.CustomTextField = Ember.TextField.extend({

  on_init: (->
    if @get('value') in @get('custom_values')
      @set('disabled', true)
  ).on('init')

  valueChanged: (->
    if @get('value') in @get('custom_values') && @get('value') != 'other'
      @set('disabled', true)
    else
      @set('disabled', false)
  ).observes('value')




})
