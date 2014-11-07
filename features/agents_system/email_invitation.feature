Feature: email invitation
  In order to users can send invite to email

  Background:
    Given a user with email "overlord@example.com"
      And I signed in as user with email "overlord@example.com"

  Scenario: send invitation
    When I go to "/cabinet"
     And I click to "invite by email"
     And I fill up input "email" as "vassal@example.com" in the form "new_user"
     And I submit form "new_user"
    Then a new user with email "vassal@eample.com" was created
     And "vassal@example.com" should receive an email
     And the user with email "vassal@eample.com" has overlord: user with email: "overlord@example.com"



  Scenario: User with email exist
    Given a user with email "vassal@example.com"
    When I go to "/cabinet"
     And I click to "invite by email"
     And I fill up input "email" as "vassal@example.com" in the form "new_user"
     And I submit form "new_user"
    Then I should see text "user exist"

