class @StepThreeAccordion
  constructor: ->
    $('.trigger').click @show_hide
    return
  show_hide: ->
    if $(this).next().css('display') == 'none'
      $(this).next().fadeIn(500)
    else
      $(this).next().fadeOut(500)
