#Умный селектор на элегантном костыле

(($) ->
  $.widget "custom.combobox",
    _create: ->
      @wrapper = $("<span>").addClass("custom-com\u0001bobox").insertAfter(@element)
      @element.hide()
      @_createAutocomplete()
      @_createShowAllButton()
      return

    _createAutocomplete: ->
      selected = undefined
      value = undefined
      selected = undefined
      value = undefined
      selected = undefined
      value = undefined
      selected = @element.children(":selected")
      value = ((if selected.val() then selected.text() else ""))
      @input = $("<input>").appendTo(@wrapper).val(value).attr("title", "").addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left").autocomplete(
        delay: 0
        minLength: 0
        source: $.proxy(this, "_source")
      ).tooltip(tooltipClass: "\u0001ui-state-highlight")
      @_on @input,
        autocompleteselect: (event, ui) ->
          ui.item.option.selected = true
          @_trigger "select", event,
            item: ui.item.option

          return

        autocompletechange: "_removeIfInvalid"

      return

    _createShowAllButton: ->
      input = undefined
      wasOpen = undefined
      input = undefined
      wasOpen = undefined
      input = undefined
      wasOpen = undefined
      input = @input
      wasOpen = false
      $("<a>").attr("tabIndex", -1).attr("title", "Show All Items").tooltip().appendTo(@wrapper).button(
        icons:
          primary: "ui-icon-triangle-1-s"

        text: false
      ).removeClass("ui-corner-all").addClass("custom-combobox-toggle ui-corner-right").mousedown(->
        wasOpen = input.autocomplete("widget").is(":visible")
        return
      ).click ->
        input.focus()
        return  if wasOpen
        input.autocomplete "search", ""
        return

      return

    _source: (request, response) ->
      matcher = undefined
      matcher = undefined
      matcher = undefined
      matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i")
      response @element.children("option").map(->
        text = undefined
        text = undefined
        text = undefined
        text = $(this).text()
        if @value and (not request.term or matcher.test(text))
          label: text
          value: text
          option: this
      )
      return

    _removeIfInvalid: (event, ui) ->
      valid = undefined
      value = undefined
      valueLowerCase = undefined
      valid = undefined
      value = undefined
      valueLowerCase = undefined
      valid = undefined
      value = undefined
      valueLowerCase = undefined
      return  if ui.item
      value = @input.val()
      valueLowerCase = value.toLowerCase()
      valid = false
      @element.children("option").each ->
        if $(this).text().toLowerCase() is valueLowerCase
          @selected = valid = true
          false

      return  if valid
      @input.val("").attr("title", value + " didn't match any item").tooltip "open"
      @element.val ""
      @_delay (->
        @input.tooltip("close").attr "title", ""
        return
      ), 2500
      @input.autocomplete("instance").term = ""
      return

    _destroy: ->
      @wrapper.remove()
      @element.show()
      return

  return
) jQuery



class @SmartSelector
  constructor: ->
    $('#order_location_id').combobox()
    $('#order_location_id').hasScrollBar();
    return