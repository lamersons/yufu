Yufu.FormattedTimestampMixin = Ember.Mixin.create(
  format: 'DD/M/YYYY'

  formattedUpdatedAt: (->
    date = @.get 'updated_at'
    format = @.get 'format'
    moment(date).format format
  ).property('updated_at', 'format')

)