# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
flag = Admin.create email: 'admin@example.com', password: 'password'
if flag
  admin = Admin.last
  admin.permissions << Permission.new(action: 'manage', subject_class: :all)
  admin.save
end
# Create and set enabled ru and en locales
Localization.create name: 'ru', enable: true
Localization.create name: 'en', enable: true
