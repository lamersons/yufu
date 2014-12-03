scrollToDiv = (element, navheight) ->
  offset = element.offset()
  offsetTop = offset.top
  totalScroll = offsetTop - navheight
  $("BODY, HTML").animate
    scrollTop: totalScroll
  , 500
  return

finish_animations = ->
  $(".block.first .item").find(".over").finish()
  $(".first-points .item").find(".over").finish()
  return

class @Accordion
  constructor: ->
    $(".block.first .item").click @show_hide
    $(".block.first .item").hover @show_menu_over, @hide_menu_over
    $(".first-points .item").hover @show_over, @hide_over

  show_hide: ->
    if $(this).hasClass('inactive-item')
      target = $(this).data("target")
      scrollToDiv $("DIV.block DIV.item P.h2"), 20
      $(".first-points .container").hide()
      $(".first-points").show()
      $(".first-points .container." + target).show()
      $(".block.first .active-item").removeClass('active-item').addClass('inactive-item')
      $(this).removeClass('inactive-item').addClass('active-item')
      $(".block.first .active-item a").fadeTo('fast', 1)
      $(".block.first .active-item p.h2").fadeTo('fast', 1)
      $(".block.first .inactive-item a").fadeTo('slow', 0.3)
      $(".block.first .inactive-item p.h2").fadeTo('slow', 0.3)


  show_menu_over: ->
    if $(this).hasClass('inactive-item')
      finish_animations()
      $(this).find(".over").fadeIn('fast')
    return

  hide_menu_over: ->
    finish_animations()
    if $(this).hasClass('inactive-item')
      $(this).find(".over").fadeOut('fast')
    else
      if ($(this).children().last().is(':visible'))
        $(this).find(".over").fadeOut('fast')
    return

  show_over: ->
    finish_animations()
    $(this).addClass "active"
    $(this).find("DIV.over").fadeIn('fast')
    return

  hide_over: ->
    $(this).removeClass "active"
    $(this).find("DIV.over").fadeOut('fast')
    return


