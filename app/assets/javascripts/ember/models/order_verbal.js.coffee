# for more details see: http://emberjs.com/guides/models/defining-models/
Yufu.OrderVerbalAdapter = Yufu.OrderAdapter.extend()

Yufu.OrderVerbal = Yufu.Order.extend {
  translator_sex: DS.attr 'string'
}
