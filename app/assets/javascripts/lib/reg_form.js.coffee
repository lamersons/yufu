class @RegForm
  constructor: ->
    $('#new_user').bind 'ajax:beforeSend', @pending
    $('#new_user').bind 'ajax:success', @form_success
    $('#new_user').bind 'ajax:error', @form_error
    $('.block.second .item').click @set_user_type
    $('.block.second .item').hover @active_arrow, @default_arrow

  pending: ->
    $('.check .message').hide()
    $('.reg-form #main_register_submit').prop 'disabled', true
    $('.reg-form .load-icon').show()

  form_success: (data1, data2)->
    $('.reg-form .load-icon').hide()
    $('.success.message').show()
    $('.reg-form input#user_email').attr('readonly', true)
    $('#main_register_submit').attr('disabled', true)
    return false

  form_error: (data1, data2)->
    $('.reg-form .load-icon').hide()
    error = data2.responseJSON.errors.email[0]
    $('.error.message').html('')
    if (error.indexOf('taken') > -1)
      $('.error.message').append(I18n.t('main.email_already_registered'))
    if (error.indexOf('blank') > -1)
      $('.error.message').append(I18n.t('main.email_should_not_be_blank'))
    if (error.indexOf('invalid') > -1)
      $('.error.message').append(I18n.t('main.wrong_format_of_email'))
    $('.error.message').show()
    $('#main_register_submit').attr('disabled', false)
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
      $('.after-input-text').hide()
      $('.reg-form input#user_email').attr('readonly', false)
      $('#main_register_submit').removeAttr('disabled')
      $('.block.second .arrow').show()
      $('.block.second .active .arrow').hide()
      $('.reg-form .now span').html('как ' + I18n.t(target))

  active_arrow: ->
    $(this).find("SPAN.arrow").removeClass("icons-arrow-second-default").addClass "icons-arrow-second-h"
    return

  default_arrow: ->
    $(this).find("SPAN.arrow").removeClass("icons-arrow-second-h").addClass "icons-arrow-second-default"
    return