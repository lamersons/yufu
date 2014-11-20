#= require jquery
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


