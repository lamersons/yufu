And(/^I fill up input "(.*?)" as "(.*?)" in the form "(.*?)"$/) do |name, value, form|
  within "##{form}" do
    fill_in name, with: value
  end
end

And(/^I submit the form "(.*?)"$/) do |form|
  within "##{form}" do
    find("[type=submit]").click
  end
  sleep(1)
end

Then(/^I should be redirected to edit password page$/) do
  uri = URI.parse(current_url)
  expect(uri.path).to eq('/user/edit')
end