And(/^I click on link "(.*?)"$/) do |type|
  page.find(".item.#{type}").click
end

Then(/^I should see form for new "(.*?)" order$/) do |type|
  expect(page).to have_css(".container.#{type}")
end