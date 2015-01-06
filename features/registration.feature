Feature: Registration
  In order to users can register on the service

  Background:
    Given object of "language" with name: "Russian"
    And   object of "language" with name: "Mumbu-umbu"

  @javascript
  Scenario: Submit registration form
    When I go to "/"
     And Select user's type: "translator"
     And I fill up input "user[email]" as "email@example.com" in the form "new_user"
     And I submit the form "new_user"
    Then "email@example.com" should receive an email
     And a user with email "email@example.com" should be exist
     And a user with email "email@example.com" should have profile "translator"

  @javascript
  Scenario: First sign in
    Given a user with email: "email@example.com", password: "password"
    When I go to "/users/sign_in"
     And I fill up input "user[email]" as "email@example.com" in the form "new_user"
     And I fill up input "user[password]" as "password" in the form "new_user"
     And I submit the form "new_user"
    Then I should be redirected to edit password page

  @javascript
  Scenario: New password cannot be equals old password
    Given a user with email: "email@example.com", password: "password"
    When I go to "/users/sign_in"
    And I fill up input "user[email]" as "email@example.com" in the form "new_user"
    And I fill up input "user[password]" as "password" in the form "new_user"
    And I submit the form "new_user"
    And I fill up input "user[password]" as "password" in the form "edit_password"
    And I fill up input "user[password_confirmation]" as "password" in the form "edit_password"
    And I submit the form "edit_password"
    Then I should see error on form "edit_password"