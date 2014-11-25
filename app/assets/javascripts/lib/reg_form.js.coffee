class @RegForm
  constructor: ->
    $('#new_user').bind 'ajax:success', @form_success
    $('#new_user').bind 'ajax:error', @form_error
    $('.block.second .item').click @set_user_type

  form_success: (data1, data2)->
    $('.check p').fadeOut()
    $('.check .message').fadeOut()
    $('.success.message').fadeIn(500)
    return false

  form_error: (data1, data2)->
    $('.check p').fadeOut()
    $('.check .message').fadeOut()
    $('.error.message').fadeIn(500)
    return false

  first_show = true
  set_user_type: ->
    target = $(this).data('target')
    if $(this).hasClass('active')
      $('.reg-form .' + target + '-radio').prop('checked', true)
    else
      $('.block.second .item').removeClass('active')
      $(this).addClass('active')
      if (first_show)
        $('.block.second .text-block.' + target).show('slow')
        first_show = false
      else
        $('.block.second .text-block').hide()
        $('.block.second .text-block.' + target).show()
      $('.reg-form .' + target + '-radio').prop('checked', true)
      $('.reg-form input#user_email').attr('readonly', false)
      $('#main_register_submit').removeAttr('disabled')


