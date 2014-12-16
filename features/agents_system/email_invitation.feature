Feature: email invitation
  In order to users can send invite to email

  Background:
    Given a new user with email "overlord@example.com"
      And I signed in as user with email "overlord@example.com"
      And default locales

  @javascript
  Scenario: send invitation
    When I go to "/user"
     And I click to link "#/agent/vassals"
     And I fill up input "email" as "vassal@example.com" in the form "new_user"
     And I click to submit button of the form "new_user"
    Then a user with email "vassal@example.com" should be exist
     And "vassal@example.com" should receive an email
     And the user with email "vassal@example.com" has overlord: user with email: "overlord@example.com"


  @javascript
  Scenario: User with email exist
    Given a new user with email "vassal@example.com"
    When I go to "/user"
    And I click to link "#/agent/vassals"
    And I fill up input "email" as "vassal@example.com" in the form "new_user"
    And I click to submit button of the form "new_user"
    Then I should see error

