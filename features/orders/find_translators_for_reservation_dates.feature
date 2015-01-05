Feature: Find translators for reservation dates
  Describe transition from 1-st step of ordering to 2-nd.


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

  Scenario: There is translator supported requested lananguages
    Given a translator form "NewVasjuki" with email "mumbu@example.com", sex: "famale", native_language: "Russian"
    And the translator with email "mumbu@example.com" support language: "Mumbu-umbu" with level: "expert"
    And the translator with email "mumbu@example.com" support language: "Russian" with level "expert"
    When I go to "/"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "Mumbu-umbu"
    And  I select in box "order_main_language_criterion_level" as "expert"
    And  I add one more language "Russian" with level "expert"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_sex" as "female"
    And  I check box with text: "Go by taxo"
    And  I submit the form "edit_order"
    Then I should be redirected to second step
    And I should see that date "5-12-2014" is active for language "Mumbu-umbu"
    And I should see dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is inactive for language "Mumbu-umbu"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is inactive for language "Russian"


  Scenario: There is translator supported only reserve criterion
    Given a translator form "NewVasjuki" with email "mumbu@example.com", sex: "famale", native_language: "Russian"
    And the translator with email "mumbu@example.com" support language: "Russian" with level "expert"
    When I go to "/"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "Mumbu-umbu"
    And  I select in box "order_main_language_criterion_level" as "expert"
    And  I add one more language "Russian" with level "expert"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_sex" as "female"
    And  I check box with text: "Go by taxo"
    And  I submit the form "edit_order"
    Then I should be redirected to second step
    And I should see that date "5-12-2014" is inactive for language "Mumbu-umbu"
    And I should see dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 5-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is disable for language "Russian"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is inactive for language "Mumbu-umbu"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 5-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is inactive for language "Russian"

  Scenario: There is translators with other grades
    Given a translator form "NewVasjuki" with email "expert@example.com", sex: "famale", native_language: "Russian"
    And the translator with email "expert@example.com" support language: "Mumbu-umbu" with level "expert"
    And a translator form "NewVasjuki" with email "guide@example.com", sex: "famale", native_language: "Russian"
    And the translator with email "guide@example.com" support language: "Mumbu-umbu" with level "expert"
    When I go to "/"
    And  I select verbal translation
    And  I go for create new order
    And  I select in box "order_location_id" as "NewVasjuki"
    And  I check box name: "include_near_city"
    And  I select in box "order_main_language_criterion_language" as "Mumbu-umbu"
    And  I select in box "order_main_language_criterion_level" as "businness"
    And  I add one more language "Russian" with level "expert"
    And  I select in pre calendar date: "day5-12-2014" for "8" hours
    And  I fade out "Additional"
    And  I select in box "order_translator_sex" as "female"
    And  I check box with text: "Go by taxo"
    And  I submit the form "edit_order"
    Then I should be redirected to second step
    And I should see that date "5-12-2014" is inactive for language "Mumbu-umbu"
    And I should see dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 5-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is disable for language "Russian"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is inactive for language "Mumbu-umbu"
    And I should see that dates "2-12-2014, 3-12-2014, 4-12-2014, 5-12-2014, 6-12-2014, 7-12-2014, 8-12-2014" is inactive for language "Russian"





