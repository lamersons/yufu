Feature: create verbal order
  Verbal order is created and all fields are filled.
  This feature checks if all the data is saved in the database.
  Background:
    Given object of "language" with name: "Russian"
    And object of "language" with name: "Mumbu-umbu"
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

