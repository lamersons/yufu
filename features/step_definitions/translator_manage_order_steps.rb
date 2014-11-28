Given(/^a client with email: "(.*?)", and password: "(.*?)"$/) do |email, password|
  FactoryGirl.create :client, email: email, password: password
end

Given(/^a new verbal order from client "(.*?)" with state: "(.*?)"$/) do |client_email, state|
  client = User.find_by email: client_email
  FactoryGirl.create :order_verbal, state: state, owner: client.profiles.first
end

Given(/^a new assigned verbal order from client "(.*?)" with state: "(.*?)", assignee_to "(.*?)"$/) do |client_email, state, assignee|
  client = User.find_by email: client_email
  trans  = User.find_by(email: assignee).profiles.first
  FactoryGirl.create :order_verbal, state: state, owner: client.profiles.first, assignee: trans
end


When(/^I select orders$/) do
  find_by_id('frontend.main_menu.orders').click
  sleep(1)
end

When(/^I select "(.*?)" scope$/) do |scope|
  find_by_id("frontend.orders.scopes.#{scope}").click
  sleep(1)
end

When(/^I set order as primary$/) do
  find_by_id('frontend.order_application.statuses.primary').click
  sleep(1)
end

When(/^I set order as secondary/) do
  find_by_id('frontend.order_application.statuses.secondary').click
  sleep(1)
end


Then(/^An application for order from client "(.*?)" assigned to "(.*?)" should be created$/) do |client, translator_email|
  translator = User.find_by(email: translator_email).profiles.first
  expect(Order::Application.where translator: translator).not_to be_empty
end

And(/^The order from client "(.*?)" should have state "(.*?)"$/) do |client_email, state|
  owner = User.find_by(email: client_email).profiles.first
  expect(owner.orders.first.state).to eq(state)
end

Then(/^I should see "(.*?)" order$/) do |count|
  page.should have_css('tbody tr', count: count.to_i)
end