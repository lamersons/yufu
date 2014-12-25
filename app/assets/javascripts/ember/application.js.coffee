#= require i18n
#= require jquery
#= require ckeditor/init
#= require ckeditor/adapters/jquery
#= require autogrow/plugin
#= require moment
#= require moment/ru.js
#= require handlebars
#= require ember
#= require ember-data
#= require lib/tooltips
#= require_self
#= require ./yufu
#= require datepicker/ember-date-picker.js
#= require datepicker/ember-spin-box
#= require datepicker/templates

window.Yufu = Ember.Application.create({rootElement: '#yufu_app'})


$(window).on 'dragover', (e)->
  e.preventDefault()
  e.stopPropagation()

$(window).on 'dragenter',(e)->
  e.preventDefault()
  e.stopPropagation()

$(window).on 'drop', (e)->
  e.preventDefault()
  e.stopPropagation()
  return false

Ember.RadioButton = Ember.View.extend({
    tagName : "input",
    type : "radio",
    attributeBindings : [ "name", "type", "value", "checked:checked:" ],
    click : ->
      this.set("selection", this.$().val())
  checked: (->
    return this.get("value") == this.get("selection")
  ).property()
  })

ifStepHelper = (key, v2, options)->
  v1 = @get(key)
  if(v1 == v2)
    return options.fn(this)
  return options.inverse(this)


Handlebars.registerHelper('ifStep', ifStepHelper)


