And(/^I select written translation$/) do
  page.find('.item.writing').click
  sleep(1)
end

When(/^I choose level "(.*?)"$/) do |level|
  page.find(".#{level} a").click
  sleep(1)
end

Then(/^I should see in level check box "(.*?)"$/) do |level|
  expect(page).to have_css("#order_level option[value=#{level}]:selected")
end