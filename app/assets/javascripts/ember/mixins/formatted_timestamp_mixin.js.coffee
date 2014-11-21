Yufu.FormattedTimestampMixin = Ember.Mixin.create(
  format: 'DD/M/YYYY',
  formattedBirthday: (->
    date = @.get 'birthday'
    format = @.get 'format'
    moment(date).format format
  ).property('birthday', 'format')

  formattedUpdatedAt: (->
    date = @.get 'updated_at'
    format = @.get 'format'
    moment(date).format format
  ).property('updated_at', 'format')


)