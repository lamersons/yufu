Yufu.SelectView = Ember.Select.extend({

  object: null

  change: ->
    callback = @get('onChange')
    if (callback)
      Em.run.later ()=>
        @get('controller').send(callback, @selection, @get('object'))
  on_init: (->
    if @get('object').get(@attr) in @get('content')
      @selection = @get('object').get(@attr)
    else
      @selection = 'other'
      callback = @get('onChange')
#      @get('controller').send(callback, @selection, @get('object'))
  ).on('init')



})