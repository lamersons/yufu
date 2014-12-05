class @Tooltip
  constructor: ->
    $(".js-tooltip").mouseenter @show_tooltip
    $(".js-tooltip").mouseleave @hide_tooltip

  show_tooltip: ->
    $($(@).data('target')).show()

  hide_tooltip: ->
    $($(@).data('target')).hide()