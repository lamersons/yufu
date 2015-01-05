Feature: Backoffice's messages
  In order to users can send message to backoffice and admin can reply.

  @javascript
  Scenario: User send message to backoffice
    Given a new user with email "spamer@example.com"
    And I signed in as user with email "spamer@example.com"
    When I go to "/user"
    And I click on main menu item "messages"
    And I click on button "send new messsage"
    And I fill up input "body" as "admin loh" in the form "new_message"
    And I submit the form "new_message"
    And I sign in as admin
    And I go to "admin/messages"
    Then I should see new message from "spamer@example.com"

  @javascript
  Scenario: Admin reply to message
    Given a new user with email "spamer@example.com"
    And a message from "spamer@example.com" with text: "admin kozel"
    When I sign in as admin
    And I go to "admin/messages"
    And I fill up input "body" as "sam kozel" in the form "new_message"
    And I submit the form "new_message"
    And I signed in as user with email "spamer@example.com"
    And I go to "/user"
    And I click on main menu item "messages"
    And I click on button "inbox"
    Then I shoud see a new message with text "sam kozel"