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



LanguagesGroup.create! verbal_prices_attributes: [{value: 50, level: 'guide'}, {value: 60, level: 'business'}, {value: 70, level: 'expert'}],
                       written_prices_attributes: [{value: 0.3, level: 'translate_and_correct'}, {value: 0.3, level: 'translate'}]
Language.create languages_group: LanguagesGroup.first, name: 'Russian'
Language.create languages_group: LanguagesGroup.first, name: 'Mumbu-Umbu'
Language.create languages_group: LanguagesGroup.first, name: 'English'

Localization.create name: 'ru', enable: true, language: Language.find_by(name: 'Russian')
Localization.create name: 'en', enable: true, language: Language.find_by(name: 'English')

City.create name: 'Torzhok'
City.create name: 'Moscow'