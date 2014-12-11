Given(/^a user with password and email "(.*?)", "(.*?)"$/) do |email, password|
  user = FactoryGirl.create :user, email: email
  user.update_attribute :password, password
end

And(/^object of "(.*?)" with name: "(.*?)"$/) do |model, name|
  klass = model.to_sym
  FactoryGirl.create klass, name: name
end

And(/^default locales$/) do
  Localization.create name: 'ru', enable: true
  Localization.create name: 'en', enable: true
end

And(/^today is "(.*?)"$/) do |today|
  date = Date.parse today
  Date.any_instance.stub(:today).and_return(date)
end

And(/^I select verbal translation$/) do
  page.find('.item.verbal').click
  sleep(1)

end

And(/^I go for create new order$/) do
  page.find('.item.first').hover
  page.find('.create_order').click
  sleep(1)
end

And(/^I select in box "(.*?)" as "(.*?)"$/) do |field, value|
  page.find("##{field}").select value
end

And(/^I check box name: "(.*?)"$/) do |id|
  page.find("##{id}").click
end

And(/^I fill in "(.*?)" as "(.*?)"$/) do |field, name|
  page.fill_in field, with: name
end

And(/^I select in pre calendar date: "(.*?)" for "(.*?)" hours$/) do |date, hours|
  page.find(".#{date}").click
  page.find(".#{date} em", text: hours).click
end


And(/^I fade out "(.*?)"$/) do |text|
  page.find('p', text: text).click
  sleep(1)
end

And(/^I check box with text: "(.*?)"$/) do |text|
  page.find('label', text: text).click
end
