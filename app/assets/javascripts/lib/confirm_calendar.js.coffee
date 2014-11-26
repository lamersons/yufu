class @ConfirmCalendar
  constructor: ->
    $('body').click @show_hide_dropdown
    return
  show_hide_dropdown: (object)=>
    if $(object.target).is('.dropdown-icon')
      if $(object.target).closest('td.active').find('.dropdown').css('display') == 'block'
        $(object.target).closest('td.active').find('.dropdown').fadeOut(500)
        return
      else
        $('.dropdown').fadeOut(500)
        $(object.target).closest('td.active').find('.dropdown').fadeIn(500)
        return
    if $(object.target).is('.dropdown em')
      $(object.target).closest('td.active').find('.dropdown').fadeOut(500)
      $(object.target).closest('td.active').find('input.hours').val $(object.target).html()
      $(object.target).closest('td.active').find('span b').html $(object.target).html()
      @recount_price($(object.target).closest('td.active'), $(object.target).html())
      return
    if $(object.target).closest('td.active.choosen').length > 0
      $(object.target).closest('td.active').find('input.destroy').val('1')
      $(object.target).closest('td.active.choosen').removeClass('choosen')
      return
    if $(object.target).closest('td.active').length > 0
      $('.dropdown').fadeOut(500)
      $(object.target).closest('td.active').find('input.destroy').val('0')
      $(object.target).closest('td.active').addClass('choosen')
      return
    $('.dropdown').fadeOut(500)

  recount_price: (object, hours)->
    price = parseInt $(object).data('cost')
    hours = parseInt hours
    $(object).find('.cost').html("#{price*(1+(hours-8)*1.5/8)} Eur")
    return


    return

