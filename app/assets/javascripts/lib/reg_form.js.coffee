class @RegForm
  constructor: ->
    $('#new_user').bind 'ajax:success', @form_success
    return

  form_success: (data1, data2)->
    $('#new_user').fadeOut(500)
    if data2['success']
      $('.success.message').fadeIn(500)
    else
      $('.error.message').fadeIn(500)
    return