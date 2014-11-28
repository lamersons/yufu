Given(/^a translator with email: "(.*?)", and password: "(.*?)"$/) do |email, password|
  user = User.create email: email
  user.update_attribute :password, password
  user.profiles << Profile::Translator::Base.new
  user.save
end

Given(/^an individual translator with email: "(.*?)", and password: "(.*?)"$/) do |email, password|
  user = User.create email: email
  user.update_attribute :password, password
  user.profiles << Profile::Translator::Individual.new
  user.save
end

Then(/^I should see form for edit profile$/) do
  expect(page).to have_css('.cabinet-body')
end
