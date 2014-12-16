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

And(/^I select in confirm calendar date: "(.*?)" for "(.*?)" hours$/) do |date, hours|
  page.find(".#{date} .dropdown-icon").click
  page.find(".#{date} em", text: hours).click
  page.find(".#{date}").click
end

Then(/^order should have fields "(.*?)" as "(.*?)"$/) do |fields, values|
  fields_list = fields.split(', ')
  values_list = values.split(', ')
  order = Order::Verbal.last
  fields_list.each_with_index do |field, i|
    expect(order.send(field).to_s).to eq(values_list[i])
  end

end

Given(/^a new object "(.*?)"$/) do |klass|
  FactoryGirl.create klass
end

Given(/^an empty order_verbal for user "(.*?)"$/) do |email|
  FactoryGirl.create :order_verbal, reservation_dates: [], language_criterions: [], owner: User.where(email: email).first.profiles.where(_type: 'Profile::Client').first
end

And(/^order should have one relation "(.*?)" with "(.*?)" as "(.*?)"$/) do |relations, fields, values|
  relations_list = relations.split(', ')
  fields_list = fields.split(', ')
  values_list = values.split(', ')
  order = Order::Verbal.last
  relations_list.each_with_index do |relation, i|
    expect(order.send(relation).send(fields_list[i]).to_s).to eq(values_list[i])
  end
end

And(/^order should have relation "(.*?)" with relation "(.*?)" with field "(.*?)" as "(.*?)"$/) do |first_relation, second_relation, field, value|
  order = Order::Verbal.last
  sec_rel_id = second_relation.camelize.constantize.where(field => value).first.id
  expect(order.send(first_relation).where("#{second_relation}_id"=> sec_rel_id).count).to eq(1)
end

And(/^order should have one relation "(.*?)" with relation "(.*?)" class name "(.*?)" with field "(.*?)" as "(.*?)"$/) do |first_relation, second_relation, klass, field, value|
  order = Order::Verbal.last
  sec_rel_id = klass.constantize.where(field => value).first.id
  expect(order.send(first_relation).send(second_relation).id).to eq(sec_rel_id)
end

And(/^order should have relations "(.*?)" with fields "(.*?)" as "(.*?)"$/) do |relations, fields, values|
  relations_list = relations.split(', ')
  fields_list = fields.split(', ')
  values_list = values.split(', ')
  order = Order::Verbal.last
  relations_list.each_with_index do |rel, i|
    expect(order.send(rel).where(fields_list[i] => values_list[i]).count).to eq(1)
  end
end

Given(/^order in on step "(.*?)"$/) do |step|
  Order::Verbal.last.update_attribute :step, step
end

And(/^order has a language criterion$/) do
  Order::Verbal.last.language_criterions.create language_id: Language.first.id, level: 1, cost: 10055
end

And(/^order has relation of "(.*?)" with "(.*?)" as "(.*?)"$/) do |relation, fields, values|
  params = {}
  values_list = values.split(', ')
  fields.split(', ').each_with_index do |field, i|
    params[field] = values_list[i]
  end
  Order::Verbal.last.send(relation).create params
  Order::Verbal.last.save
end

When(/^I go for edit order$/) do
  url = "/orders/#{Order::Verbal.last.id.to_s}/edit"
  visit url
end

Then(/^I should see in price preview "(.*?)" date price for "(.*?)" hours$/) do |date, hours|
  cost = Order::Verbal.last.reservation_dates.where( date: date).first.order_language_criterion.price
  price = (cost*8 + (hours.to_i-8)*1.5*cost).to_i
  expect(page).to have_css('span.pink-bright', text: "#{price} Eur")
end

And(/^order should not have relations "(.*?)" with fields "(.*?)" as "(.*?)"$/) do |relations, fields, values|
  relations_list = relations.split(', ')
  fields_list = fields.split(', ')
  values_list = values.split(', ')
  order = Order::Verbal.last
  relations_list.each_with_index do |rel, i|
    expect(order.send(rel).where(fields_list[i] => values_list[i]).count).to eq(0)
  end
end

And(/^user with email "(.*?)" has client profile$/) do |arg1|

end

And(/^user with email "(.*?)" client profile has name "(.*?)", "(.*?)"$/) do |email, first_name, last_name|
  User.where(email: email).first.update_attribute :first_name, first_name
  User.where(email: email).first.update_attribute :first_name, first_name
  User.where(email: email).first.update_attribute :last_name, last_name
  User.where(email: email).first.update_attribute :last_name, last_name
  User.where(email: email).first.profiles << FactoryGirl.create(:profile_client)
  User.where(email: email).first.save

end

And(/^I should see in fields "(.*?)" values "(.*?)"$/) do |fields, values|
  fields_list = fields.split(', ')
  values_list = values.split(', ')
  fields_list.each_with_index do |field, i|
    find_field(field).value.should eq values_list[i]
  end
end