scrollToDiv= (element, navheight) ->
  offset = element.offset()
  offsetTop = offset.top
  totalScroll = offsetTop - navheight
  $("BODY, HTML").animate
    scrollTop: totalScroll
  , 1000
  return

class @Accordion
  constructor: ->
    $(".block.first .item").click @show_hide

  show_hide: ->
    if $(this).hasClass('inactive-item')
      target = $(this).data("target")
      scrollToDiv $("DIV.block DIV.item P.h2"), 20
      $(".first-points .container").hide()
      $(".first-points").show()
      $(".first-points .container." + target).show()
      $(".block.first .active-item").removeClass('active-item').addClass('inactive-item')
      $(this).removeClass('inactive-item').addClass('active-item')
    else
      scrollToDiv $("DIV.block P.h1"), 20
      $(".first-points .container").hide('slow')
      $(this).removeClass('active-item').addClass('inactive-item')

