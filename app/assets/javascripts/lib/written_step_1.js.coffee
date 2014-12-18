class @WrittenStepOne
  constructor: ->
    $('#add_languages').on 'ajax:success', ->
      $('.modal').hide()
      $('.modal-bg').hide()
    return
