class @WrittenStepOne
  constructor: ->
    $('#add_language').click @add_language
    $('.select_translation_language').change @recount_price
    return

  add_language: ->
    $('.languages_wrap').append("<div class='col-2 half-width'>#{$('.translation_lang_wrap').html()}</div>")
    $('.languages_wrap .col-2').last().find('p').remove()
    $('.select_translation_language').change @recount_price
    return

  recount_price: ->
    prices = []
    $('.select_translation_language').each ->
      prices.push $(this).val()
    $.ajax
      url: '/orders/precount_written_price'
      data: {languages: prices, level: 'translate_and_correct'}
      dataType: 'json'
      success: (data)->
        console.log data
        for price in data.prices
          $('.langs').empty()
          $('.langs').append("<span class='text-small'>#{$('#order_original_language option').find(':selected').text()} <span class='bold'></span> #{price.name}</span>")
        return
    $.ajax
      url: '/orders/precount_written_price'
      data: {languages: prices, level:  'translate'}
      dataType: 'json'
      success: (data)->
        console.log data
        return
