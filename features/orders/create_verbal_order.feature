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
    And  I select in pre calendar date: "day5-11-2014" for "8" hours
    And  I select in pre calendar date: "day6-11-2014" for "10" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_sex" as "male"
    And  I select in box "order_translator_native_language" as "Russian"
    And  I select in box "order_native_language" as "Mumbu-umbu"
    And  I check box with text: "Go by taxo"
    And  I select in box "order_goal" as "business"
    And  I submit the form "edit_order"
    Then order should have fields "location, include_near_city" as "NewVasjuki, true"
     And order should have relation "language_criterions" with relation "language" with field "name" as "Mumbu-umbu"
     And order should have relation "language_criterions" with fields "level, cost" as "2, 100500"
     And order should have relation "reservation_dates" with fields "date, hours as "5.11.2014, 8"
     And order should have relation "reservation_dates" with fields "date, hours" as "6.11.2014, 8"
     And order should have fields "translator_sex, translator_native_language, native_language, goal", as "male, Russian, Mumbu-umbu, business"
     And order should have relation "directions" with fields "name", as "Go by taxo"






