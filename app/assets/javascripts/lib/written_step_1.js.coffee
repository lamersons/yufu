class @WrittenStepOne
  constructor: ->
    $('#add_language').click @add_language
    $('.select_translation_language').change @recount_price
    $('#order_original_language').change @recount_price
    $('#order_words_number').on 'input', @recount_price
#    $('#order_location_id').combobox()
#    $('#order_location_id').hasScrollBar()
    return

  add_language: =>
    $('.languages_wrap').append("<div class='col-2 half-width'>#{$('.translation_lang_wrap').html()}</div>")
    $('.languages_wrap .col-2').last().find('p').remove()
    $('.select_translation_language').change @recount_price
    return

  recount_price: ->
    prices = []
    $('.select_translation_language').each ->
      if $(this).val()
        prices.push $(this).val()

    if prices.length > 0
      $.ajax
        url: '/orders/precount_written_price'
        data: {languages: prices, level: 'translate_and_correct'}
        dataType: 'json'
        success: (data)->
          $('.langs').empty()
          sum = 0
          for price in data.prices
            $('.langs').append("<span class='text-small'>#{$('#order_original_language_id option:selected').text()} <span class='bold'> > </span> #{price.name} </span>")
            sum += price.price * $('#order_words_number').val()
          $('.level_1 .price_cont').html(Math.round(sum*100)/100)
          return
      $.ajax
        url: '/orders/precount_written_price'
        data: {languages: prices, level:  'translate'}
        dataType: 'json'
        success: (data)->
          $('.langs').empty()
          sum = 0
          for price in data.prices
            $('.langs').append("<span class='text-small'>#{$('#order_original_language_id option:selected').text()} <span class='bold'> > </span> #{price.name} </span>")
            sum += price.price * $('#order_words_number').val()
          $('.level_2 .price_cont').html(Math.round(sum*100)/100)
          return
