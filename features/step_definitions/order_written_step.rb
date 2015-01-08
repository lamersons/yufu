And(/^I select written translation$/) do
  page.find('.item.writing').click
  sleep(1)
end

When(/^I choose level "(.*?)"$/) do |level|
  page.execute_script "$('.#{level}').trigger('mouseenter')"
  sleep(1)
  page.find("a.#{level}").click
  sleep(1)
end

Then(/^I should see in level check box "(.*?)"$/) do |level|
  expect(page).to have_css("#order_level option[value=#{level}]:checked")
end

And(/^language group with written cost: "(.*?)" and languages: "(.*?)"$/) do |written_cost, languages|
  # lg = FactoryGirl.build :languages_group, written_prices: [FactoryGirl.build(:price_written, value: written_cost, level: 'law')]
  # languages.split ', ' do |language|
  #   lg.languages << Language.find_by(name: language)
  # end
  # lg.save!
  LanguagesGroup.first.written_prices.first.update_attributes value: 0.4
end

And(/^select translation_type as "(.*?)"$/) do |translation_type|
  page.find(".#{translation_type} > label").click
  sleep(1)
end

And(/^I should see price "(.*?)"$/) do |price|
  expect(page).to have_css(".price_cont", text: price)
end
