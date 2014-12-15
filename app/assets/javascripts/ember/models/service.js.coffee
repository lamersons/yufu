Yufu.Service = DS.Model.extend({
  level: DS.attr 'string'
  has_hsk: DS.attr 'boolean'
  verbal_price: DS.attr 'number'
  written_price: DS.attr 'number'
  written_translate_type: DS.attr 'string'
  price: DS.attr 'string'
  profile: DS.belongsTo 'profile'
  language: DS.belongsTo 'language', async: true

  val_price: (->
    res = null
    $.ajax
      url: "api/v1/languages_groups_price"
      dataType: 'json'
      data: {language_id: @get('language').content.get('id'), level: @get('level')}
      async: false
      success: (data)=>
        res = data.price
        @set('price', data.price)
    return res).property('language.id', 'level')
})