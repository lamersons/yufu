Feature: Profiles


  Scenario: Redirect to profile edit after changing password
    Given a new translator with email: "translator@example.com", and password: "password"
    When I go to "users/sign_in"
    When I go to "/users/sign_in"
     And I fill up input "email" as "translator@example.com" in the form "new_session"
     And I fill up input "password" as "password" in the form "new_session"
     And I submit the form "new_session"
    # Не помню как называется форма для смены пароля вставил edit_password наугад
     And I fill up input "password" as "newpassword" in the form "edit_password"
     And I fill up input "password_confirmation" as "newpassword" in the form "edit_password"
     And I submit the form "edit_password"
    Then I should see form for edit profile