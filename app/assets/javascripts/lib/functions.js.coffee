class @Lang
  constructor: ->
    $("#add_lang").click @add_lang
    $("#remove_lang").click @remove_lang
    $( "#target" ).submit @check_langs
    $('#order_language_criterion_language').change @count_price
    $('#order_language_criterion_level').change @count_price
  add_lang: =>
    $html = $('.inline_lang_form.invisible').html()
    $('.right-cont').append('<div class="inline_lang_form">'+$html+'</div>')
    $new_id = $('.inline_lang_form').length - 1;

    $('.inline_lang_form #order_language_criterion_language').last().attr('disabled', false)
    $('.inline_lang_form #order_language_criterion_level').last().attr('disabled', false)
    $('.inline_lang_form #order_language_criterion_cost').last().attr('disabled', false)
    $('.inline_lang_form').last().find('#id').remove()
    $('.inline_lang_form #remove_lang').last().click @remove_lang
    if ($new_id > 0)
      $('.inline_lang_form .remove_lang').last().show()

  remove_lang: ->
    $(@).parents('.inline_lang_form').remove()


  count_price: ->
    $.ajax
      url: "/api/v1/languages_groups_price"
      dataType: 'json'
      data: {language_id: $(@).closest('.inline_lang_form').find('#order_language_criterion_language').val(), level: $(@).closest('.inline_lang_form').find('#order_language_criterion_level').val()}
      async: false
      success: (data)=>
        $(@).closest('.inline_lang_form').find('#order_language_criterion_cost').val(data.price)