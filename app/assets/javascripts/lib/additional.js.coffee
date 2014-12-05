class @Additional
  constructor: ->
    $(".additional-trigger").click @show_hide_additional

  show_hide_additional: ->
    if ($('.additional').is(':visible'))
      $('.additional').hide()
      $('.additional-trigger span.caret').removeClass('icons-caret-pink-down')
      $('.additional-trigger span.caret').addClass('icons-caret-pink-right')
    else
      $('.additional').show()
      $('.additional-trigger span.caret').addClass('icons-caret-pink-down')
      $('.additional-trigger span.caret').removeClass('icons-caret-pink-right')