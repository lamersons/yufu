class @ConfirmCalendar

  first_date: null

  constructor: ->
    $('body').click @show_hide_dropdown
    @first_date = $('td.date-cont').first()
    $('.arrow.right').click @next_week
    $('.arrow.left').click @prev_week
    $('#edit_order').submit @validate_form
    @rerender()
    return
  show_hide_dropdown: (object)=>
    if $(object.target).closest('td.empty').length > 0
      return

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
      @recount_price $(object.target).closest('td.active'), $(object.target).closest('td.active').find('span b').html()
      return
    if $(object.target).closest('td.active').length > 0
      $('.dropdown').fadeOut(500)
      $("td[data-date='#{$(object.target).closest('td.active').data('date')}']").removeClass('choosen')
      $("td[data-date='#{$(object.target).closest('td.active').data('date')}']").find('input').attr('disabled', true)
      $(object.target).closest('td.active').find('input.destroy').val('0')
      $(object.target).closest('td.active').find('input').attr('disabled', false)
      $(object.target).closest('td.active').addClass('choosen')
      @recount_price $(object.target).closest('td.active'), $(object.target).closest('td.active').find('span b').html()
      return
    $('.dropdown').fadeOut(500)

  validate_form: ->
    if $("input.destroy[value='0']").length == 0
      $('#should_confirm').show()
      return false
    return true

  recount_price: (object, hours)->
    price = parseFloat $(object).data('cost')
    hours = parseInt hours
    $(object).find('.cost').html("#{price * 8 + 1.5 * price * (hours - 8)} Eur")
    sum = 0
    cost_str = ''
    $('.choosen').each (i)->
      cost_str += "#{$(this).find('.cost').html()} + "
      sum += parseFloat $(this).find('.cost').html()
    cost_str = cost_str.substring(0, cost_str.length - 2)
    cost_str += "= <span class='bold pink-bright'>#{sum} Eur</span>"
    $('.bordered-block p').html cost_str
    return

  next_week: =>
    date = @first_date
    for i in [1..7]
      date = $(date).next()
    if date.next().is('.date-cont')
      $('td.date-cont').fadeOut(500)
      $('td.active').fadeOut(500)
      date = @first_date
      for i in [1..7]
        date = $(date).next()
      @first_date = date
      @rerender()
    return

  prev_week: =>
    if @first_date.prev().is('.date-cont')
      $('td.date-cont').fadeOut(500)
      $('td.active').fadeOut(500)
      date = @first_date
      for i in [1..7]
        date = $(date).prev()
      if date.length > 0
        @first_date = date
        @rerender()
      return

  rerender: ->
    date = @first_date
    for i in [1..7]
      if date.length > 0
        $(date).fadeIn(500)
        klass = ".date_#{$(date).data('num')}"
        $(klass).fadeIn(500)
        if $(klass).length == 0
          $('.empty').fadeIn(500)
        date = $(date).next()
      else
        $('tr').append('<td class="active empty"></td>')





