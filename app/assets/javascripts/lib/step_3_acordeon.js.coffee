class @StepThreeAccordion
  constructor: ->
    $('.trigger').click @show_hide
    return
  show_hide: ->
    if $(this).next().css('display') == 'none'
      $(this).next().show()
    else
      $(this).next().hide()
