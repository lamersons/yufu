Given(/^a user with email "(.*?)"$/) do |email|
  FactoryGirl.create :user, email: email, password: 'password'
end

Given(/^I signed in as user with email "(.*?)"$/) do |email|
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => 'password'
  click_button "Log in"
end

When(/^I click to link "(.*?)"$/) do |href|
  find(:xpath, "//a[@href='#{href}']").click
end

Then(/^I should see error$/) do
  expect(page).to have_css('.error')
end