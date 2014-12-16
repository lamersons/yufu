When(/^I go to "(.*?)"$/) do |url|
  visit url
end

And(/^Select user's type: "(.*?)"$/) do |type|
  page.find(".item.#{type}").click
end

And(/^a user with email "(.*?)" should be exist$/) do |email|
  expect(User.where(email: email).first).not_to eq(nil)
end

And(/^a user with email "(.*?)" should have profile "(.*?)"$/) do |email, profile|
  klass = (profile == 'client' ? 'Profile::Client' : 'Profile::Translator::Base')
  expect(User.where(email: email).first.profiles.first.class).to eq(klass.constantize)
end

Given(/^a user with email: "(.*?)", password: "(.*?)"$/) do |email, password|
  FactoryGirl.create :user, email: email, password: password
end