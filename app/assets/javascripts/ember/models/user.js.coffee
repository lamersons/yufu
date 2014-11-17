
Yufu.User = DS.Model.extend
  email: DS.attr 'string'
  profiles : DS.hasMany('profile', {async:true, embedded: true})
