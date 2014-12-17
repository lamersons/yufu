class @TabularController
  constructor: ->
    @tabular = $('.tabular')
    $('.tabular .menu .tab-item').click @menuOnClickHandler

  menuOnClickHandler: (e) =>
    @tabular.find('.tab-item.selected').removeClass 'selected'
    @tabular.find('.tab.open').removeClass 'open'
    tabId = e.target.id
    $('.tab-item#' + tabId).addClass 'selected'
    $(".tab[binding-id='#{tabId}']").addClass 'open'
