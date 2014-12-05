class @Calendar

  start_date: null
  choosen: []
  days_num: 0


  constructor: ->
    #TODO: send dates on different pages on submit
    @start_date = new Date
    @start_date.setDate(1)
    @render_calendar()
    $('.calendar .arrow.right').click @next_page
    $('.calendar .arrow.left').click @prev_page
    $('body').click @date_click
    return

  render_calendar: ->
    $('.choosen').removeClass('choosen')
    $('table .table_body td sup').empty()
    $('table .table_body td input').val('')
    date = new Date(@start_date)
    dateNextMonth = new Date(@start_date)
    dateNextMonth.setMonth(dateNextMonth.getMonth()+1)
    $('.calendar-title').html "#{I18n.t(moment(date).format('MMMM'))} #{date.getFullYear()} -
        #{I18n.t(moment(dateNextMonth).format('MMMM'))} #{date.getFullYear()}"
    $('table .table_body td').each (index)->
      if $(this).find('.day').length > 0
        $(this).find('.day').html(date.getDate())
        $(this).find('input').attr('name', date)
        $(this).removeClass()
        $(this).addClass("#{date.getDate()}-#{date.getMonth()}-#{date.getFullYear()}")
        date.setDate(date.getDate()+1)
    for work_day in @choosen
      day = new Date(work_day['date'])
      if $(".#{day.getDate()}-#{day.getMonth()}-#{day.getFullYear()}").length > 0
        $(".#{day.getDate()}-#{day.getMonth()}-#{day.getFullYear()}").addClass('choosen')
        $(".#{day.getDate()}-#{day.getMonth()}-#{day.getFullYear()}").find('sup').html(work_day['hours'])
        $(".#{day.getDate()}-#{day.getMonth()}-#{day.getFullYear()}").find('input').val(work_day['hours'])
    return
  next_page: =>
    @start_date.setDate(@start_date.getDate()+42)
    @render_calendar()
  prev_page: =>
    @start_date.setDate(@start_date.getDate()-42)
    @render_calendar()

  date_click: (object)=>
    $('.dropdown').fadeOut(500)
    if $(object.target).closest('.choosen').is('td')

      @unchoose_date $(object.target).closest('.choosen').find('input')
      @unchoose_date $(object.target).closest('.choosen').find('sup').empty()
      $(object.target).closest('.choosen').find('input').val('')
      $("#real_date_inputs [name='#{$(object.target).closest('.choosen').data('input')}']").next().remove()
      $("#real_date_inputs [name='#{$(object.target).closest('.choosen').data('input')}']").remove()
      $(object.target).closest('.choosen').removeClass('choosen')
      return
    if $(object.target).closest('table .table_body td')
      @show_hide_dropdown($(object.target).closest('table .table_body td').find('.dropdown'))
    if $(object.target).is('.dropdown em')
      $(object.target).parent().parent().addClass('choosen')

      $(object.target).parent().parent().find('sup').html $(object.target).html()
      $(object.target).parent().parent().find('input').val $(object.target).html()
      @choose_date $(object.target).parent().parent().find('input').attr('name'), $(object.target).html(), $(object.target).closest('td')

    return

  show_hide_dropdown: (elem)->
    if $(elem).css('display') == 'block'
      $(elem).fadeOut(500)
    else
      $(elem).fadeIn(500)

  choose_date: (date, hours, parent)->
    @days_num += 1
    @choosen.push {date: date, hours: hours}
    $(parent).data('input', "order[reservation_dates_attributes][#{@days_num}][date]")
    $('#real_date_inputs').append("<input name='order[reservation_dates_attributes][#{@days_num}][date]' value='#{moment(date).format('D.M.YYYY')}'>")
    $('#real_date_inputs').append("<input name='order[reservation_dates_attributes][#{@days_num}][hours]' value='#{hours}'>")

  unchoose_date: (date)->
    for item in @choosen
      if item['date'] == date
        $("#real_date_inputs input[value=#{item['date']}]")
        $("#real_date_inputs input[value=#{item['hours']}]")
        i = @choosen.indexOf item
        unless i==-1
          @days_num =- 1
          @choosen.splice(i, 1)
