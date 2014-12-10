Given(/^a user with password and email "(.*?)", "(.*?)"$/) do |email, password|
  user = FactoryGirl.create :user, email: email
  user.update_attribute :password, password
end

And(/^object of "(.*?)" with name: "(.*?)"$/) do |model, name|
  klass = model.camelize
  klass.constantize.new name: name
end


And(/^today is "(.*?)"$/) do |today|
  DateTime.any_instance.stub(:now) {date}
end

And(/^I select verbal translation$/) do
  pending # express the regexp above with the code you wish you had
end

And(/^I go for create new order$/) do
  pending # express the regexp above with the code you wish you had
end