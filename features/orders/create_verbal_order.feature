Feature: create verbal order
  Verbal order is created and all fields are filled.
  This feature checks if all the data is saved in the database.
  Background:
    Given a user with password and email "user@example.com", "password"
    And object of "city" with name: "NewVasjuki"
    And object of "city" with name: "OldMoscow"
    And object of "language" with name: "Russian"
    And object of "language" with name: "Mumbu-umbu"
    And object of "direction" with name: "Go by taxo"
    And object of "direction" with name: "Go by cab"
    And object of "car" with name: "Limuzin"
    And object of "car" with name: "Zaporozhets"
    And default locales
    And today is "01.11.2014"

  @javascript
  Scenario: fulfil the form on step one
    When I go to "/"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_language_criterion_language" as "Mumbu-umbu"
    And  I select in box "order_language_criterion_level" as "Gide"
    And  I fill in "order_language_criterion_cost" as "100500"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I select in pre calendar date: "day6-12-2014" for "10" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_sex" as "female"
    And  I select in box "order_translator_native_language_id" as "Russian"
    And  I select in box "order_native_language_id" as "Mumbu-umbu"
    And  I check box with text: "Go by taxo"
    And  I select in box "order_goal" as "business"
    And  I submit the form "edit_order"
    And order should have fields "include_near_city, translator_sex, goal" as "true, female, business"
    Then order should have one relation "location, translator_native_language, native_language" with "name, name, name" as "NewVasjuki, Russian, Mumbu-umbu"
     And order should have relations "language_criterions, language_criterions" with fields "level, cost" as "1, 100500"
     And order should have relations "reservation_dates, reservation_dates" with fields "date, hours" as "2014-12-05 00:00:00 UTC, 8"
     And order should have relations "reservation_dates, reservation_dates" with fields "date, hours" as "2014-12-06 00:00:00 UTC, 8"
     And order should have relations "directions" with fields "name" as "Go by taxo"
     And order should have relation "language_criterions" with relation "language" with field "name" as "Mumbu-umbu"

    @javascript
    Scenario: fulfil the form on step two
      Given an empty order_verbal for user "user@example.com"
      And   order in on step "2"
      And   order has a language criterion
      And   order has relation of "reservation_dates" with "date, hours" as "2014-12-05 00:00:00 UTC, 8"
      And   order has relation of "reservation_dates" with "date, hours" as "2014-12-06 00:00:00 UTC, 8"
      When  I go for edit order
      And   I select in confirm calendar date: "day05-12-2014" for "10" hours
      Then  I should see in price preview "2014-12-05 00:00:00 UTC, 8" date price for "10" hours
      And   I submit the form "edit_order"
      And   order should have relations "reservation_dates, reservation_dates" with fields "date, hours" as "2014-12-05 00:00:00 UTC, 10"
      And   order should not have relations "reservation_dates, reservation_dates" with fields "date, hours" as "2014-12-06 00:00:00 UTC, 8"


    @javascript
    Scenario: fulfil the form on step three
      Given user with email "user@example.com" client profile has name "Vasya", "Pupking"
      And   an empty order_verbal for user "user@example.com"
      And   order in on step "3"
      And   order has a language criterion
      And   order has relation of "reservation_dates" with "date, hours" as "2014-12-05 00:00:00 UTC, 8"
      And   order has relation of "reservation_dates" with "date, hours" as "2014-12-06 00:00:00 UTC, 8"
      When  I go for edit order
      And   I fill in "user_email" as "user@example.com"
      And   I fill in "user_password" as "password"
      And   I submit the form "new_user"
      And   I should see in fields "order_client_info_attributes_first_name, order_client_info_attributes_last_name" values "Vasya, Pupking"
      And   I fill in "order_client_info_attributes_first_name" as "Petja"
      And   I fill in "order_client_info_attributes_last_name" as "Klushking"
      And   I select in box "order_client_info_attributes_birthday_1i" as "1950"
      And   I select in box "order_client_info_attributes_birthday_2i" as "1"
      And   I select in box "order_client_info_attributes_birthday_3i" as "1"
      And   I fill in "order_client_info_attributes_company" as "Nimfa"
      And   I select in box "order_client_info_attributes_country" as "Svaziland"
      And   I fade out "Airport Pick Up"
      And   I check box name: "need_car"
      And   I fill in "order_airport_pick_up_attributes_flight_number" as "100500"
      And   I fill in "order_airport_pick_up_attributes_airport_name" as "Vnukovo"
      And   I select in box "order_airport_pick_up_attributes_arriving_date_1i" as "1950"
      And   I select in box "order_airport_pick_up_attributes_arriving_date_2i" as "1"
      And   I select in box "order_airport_pick_up_attributes_arriving_date_3i" as "1"
      And   I fade out "Car rent"
      And   I check box with text: "Zaporozhets"
      And   I select in box "order_car_rent_attributes_duration" as "5"
      And   I fade out "Hotel Greetings"
      And   I select in box "order_hotel_attributes_greeted_at_4i" as "00"
      And   I select in box "order_hotel_attributes_greeted_at_5i" as "00"
      And   I check box with text: "Bank"
      And   I check box name: "agree"
      And   I submit the form "edit_order"
      Then order should have one relation "client_info" with "first_name, last_name, country, company, birthday" as "Petja, Klushking, Svaziland, Nimfa, 1950-01-01 00:00:00 UTC"
      Then order should have one relation "airport_pick_up" with "need_car, flight_number, airport_name, arriving_date" as "true, 100500, Vnukovo, 1950-01-01 00:00:00 UTC"
      Then order should have one relation "car_rent" with relation "car" class name "Order::Car" with field "name" as "Zaporozhets"
      Then order should have one relation "car_rent" with "duration" as "5"
      And order should have fields "pay_way" as "bank"