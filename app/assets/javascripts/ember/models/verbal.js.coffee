# for more details see: http://emberjs.com/guides/models/defining-models/
Yufu.VerbalAdapter = Yufu.OrderAdapter.extend()

Yufu.Verbal = Yufu.Order.extend {
  translator_sex:          DS.attr 'string'
  location_name:           DS.attr 'string'
  reservation_dates_count: DS.attr 'number'
}
