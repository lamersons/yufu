Feature: create verbal order
  Verbal order is created and all fields are filled.
  This feature checks if all the data is saved in the database.
  Background:
    Given object of "language" with name: "Russian"
    And object of "language" with name: "Mumbu-umbu"
    And language group with written cost: "0.4" and languages: "Russian, Mumbu-umbu"
    And default locales

  @javascript
  Scenario Outline: Create order in different directions
    When I go to "/"
    And I select written translation
    And I choose level "<level>"
    Then I should see in level check box "<level>"

  Examples:
    | level                 |
    | law                   |
    | technical             |
    | standard              |
    | artistic              |
    | site_localisation     |
    | language_localisation |

  @javascript
  Scenario: Create first step
    When I go to "/"
    And  I select written translation
    And  I choose level "law"
    And  I select in box "order_original_language_id" as "Mumbu-umbu"
    And  I select in box "order_translation_language_ids" as "Russian"
    And  I fill in "order_words_number" as "100"
    And  select translation_type as "translate_and_correct"
    Then I should see price "57.14"
    And I submit the form "edit_order"
    And "order/written" should have one relation "original_language" with "name" as "Mumbu-umbu"
    And "order/written" should have relations "translation_languages" with fields "name" as "Russian"
    And "order/written" should have fields "level, translation_type, words_number" as "law, translate_and_correct, 100"
