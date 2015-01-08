Feature: Cash flow for verbal orders

  Background:
    Given a language group with name: "first"
    And a language with name: "English" of the "first" group
    And a language with name: "French" of the "first" group
    And a language with name: "Chinese" of the "first" group
    And object of "city" with name: "NewVasjuki"
    And an office in "NewVasjuki"
    And a user with email "partners_agent@example.com"
    And a user with email "translator_agent@example.com"
    And a user with email "partner@example.com", overlord: "partners_agent@example.com"
    And a user with email "client@exmaple.com"
    And today is "01.11.2014"
    And a translator form "NewVasjuki" with email "french_translator@example.com", native_language: "French", overlord: "translator_agent@example.com"
    And a senior translator form "NewVasjuki" with email "senior_french_translator@example.com", native_language: "French"
    And the translator with email "french_translator@example.com" support language: "French" with level "guide"
    And the translator with email "senior_french_translator@example.com" support language: "French" with level "guide"


  Scenario: 1a. English language and need chinese.
    When I visit site from link of "partner@example.com"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "English"
    And  I select in box "order_main_language_criterion_level" as "guide"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_native_language_id" as "Chinese"
    And  I submit the form "edit_order"
    And  I paid order
    Then "partners_agent@example.com" has received an award "6"% of the order price
    And  "partners_agent@example.com" has received an award "1.5"% of the order price
    And  a balance of the office in "NewVasjuki"  has been increased by "70"% of the order price
    And  order is not available for translators

  Scenario: 1b. Other language. Translator has closed order
    When I visit site from link of "partner@example.com"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "French"
    And  I select in box "order_main_language_criterion_level" as "guide"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_native_language_id" as "Chinese"
    And  I submit the form "edit_order"
    And  I paid order
    Then "partners_agent@example.com" has received an award "6"% of the order price
    And  "partners_agent@example.com" has received an award "1.5"% of the order price
    And  order is available for translators
    But  a balance of the office in "NewVasjuki" hasn't been increased
    When the order assignee to "french_translator@example.com"
    And  the order is completed
    Then "translator_agent@example.com" has received an award "1.5"% of the order price
    And  "french_translator@example.com" has received an award "70"% of the order price
    And  "senior_french_translator@example.com" has received an award "3"% of the order price

  Scenario: 1b. Other language. Senior translator has closed order
    When I visit site from link of "partner@example.com"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "French"
    And  I select in box "order_main_language_criterion_level" as "guide"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_native_language_id" as "Chinese"
    And  I submit the form "edit_order"
    And  I paid order
    Then "partners_agent@example.com" has received an award "6"% of the order price
    And  "partners_agent@example.com" has received an award "1.5"% of the order price
    And  order is available for translators
    But  a balance of the office in "NewVasjuki" hasn't been increased
    When the order assignee to "senior_french_translator@example.com"
    And  the order is completed
    Then "translator_agent@example.com" has received an award "1.5"% of the order price
    And  "senior_french_translator@example.com" has received an award "70"% of the order price


  Scenario: 1b. not chinese
    When I visit site from link of "partner@example.com"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "English"
    And  I select in box "order_main_language_criterion_level" as "guide"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I submit the form "edit_order"
    And  I paid order
    Then "partners_agent@example.com" has received an award "6"% of the order price
    And  "partners_agent@example.com" has received an award "1.5"% of the order price
    And  order is available for translators
    But  a balance of the office in "NewVasjuki" hasn't been increased
    When the order assignee to "french_translator@example.com"
    And  the order is completed
    Then "translator_agent@example.com" has received an award "1.5"% of the order price
    And  "french_translator@example.com" has received an award "70"% of the order price
    And  "senior_french_translator@example.com" has received an award "3"% of the order price



