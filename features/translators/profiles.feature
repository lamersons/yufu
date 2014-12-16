Feature: Profiles

  Scenario: Redirect to profile edit after changing password
    Given a translator with email: "translator@example.com", and password: "password"
    When I go to "users/sign_in"
    When I go to "/users/sign_in"
     And I fill up input "user[email]" as "translator@example.com" in the form "new_user"
     And I fill up input "user[password]" as "password" in the form "new_user"
     And I submit the form "new_user"
     And I fill up input "user[password]" as "newpassword" in the form "edit_password"
     And I fill up input "user[password_confirmation]" as "newpassword" in the form "edit_password"
     And I submit the form "edit_password"
    Then I should see form for edit profile