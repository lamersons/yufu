#= require i18n
#= require jquery
#= require moment
#= require moment/ru.js
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./yufu
#= require datepicker/ember-date-picker.js
#= require datepicker/ember-spin-box
#= require datepicker/templates

# for more details see: http://emberjs.com/guides/application/
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

