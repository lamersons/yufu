Yufu.Education = DS.Model.extend({

  grade:          DS.attr 'string'
  specialization: DS.attr 'string'
  university:     DS.attr 'string'
  location:       DS.attr 'string'

  profile: DS.belongsTo 'profile'

})