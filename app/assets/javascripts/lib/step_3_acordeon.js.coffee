class @StepThreeAccordion
  constructor: ->
    $('.trigger').click @show_hide
    $('#order_airport_pick_up_attributes_arriving_date_1i').on 'change', @update_greeting_date
    $('#order_airport_pick_up_attributes_arriving_date_2i').on 'change', @update_greeting_date
    $('#order_airport_pick_up_attributes_arriving_date_3i').on 'change', @update_greeting_date
    $('#edit_order').submit @check_agree
    return
  show_hide: ->
    if $(this).next().css('display') == 'none'
      $(this).next().show()
    else
      $(this).next().hide()

  update_greeting_date: ->
    $('#greet_time').html("#{$('#order_airport_pick_up_attributes_arriving_date_3i').val()}-#{$('#order_airport_pick_up_attributes_arriving_date_2i').val()}-#{$('#order_airport_pick_up_attributes_arriving_date_1i').val()}")
    return

  check_agree: ->
    if $('#i_agree').prop( "checked")
      return true
    else
      $('#should_agree').show()
      return false