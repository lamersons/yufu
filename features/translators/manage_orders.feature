Feature: Manage orders

  Background:
    Given an individual translator with email: "translator@example.com", and password: "password"
      And a client with email: "client@example.com", and password: "password"
      And I signed in as user with email "translator@example.com"

  @javascript
  Scenario: Assign as primary
    Given a new verbal order from client "client@example.com" with state: "wait_application"
    When I go to "/user"
    And I select orders
    And I set order as primary
    Then An application for order from client "client@example.com" assigned to "translator@example.com" should be created
    And The order from client "client@example.com" should have state "in_progress"

  @javascript
  Scenario: Assign as secondary
    Given a new verbal order from client "client@example.com" with state: "wait_application"
    When I go to "/user"
    And I select orders
    And I set order as secondary
    Then An application for order from client "client@example.com" assigned to "translator@example.com" should be created
    And The order from client "client@example.com" should have state "wait_application"

  @javascript
  Scenario: Show in_progress orders
    Given a new verbal order from client "client@example.com" with state: "wait_application"
      And a new assigned verbal order from client "client@example.com" with state: "in_progress", assignee_to "translator@example.com"
    When I go to "/user"
     And I select orders
     And I select "in_progress" scope
    Then I should see "1" order

  @javascript
  Scenario: Show in_progress orders
    Given a new verbal order from client "client@example.com" with state: "wait_application"
    And a new assigned verbal order from client "client@example.com" with state: "close", assignee_to "translator@example.com"
    When I go to "/user"
    And I select orders
    And I select "closed" scope
    Then I should see "1" order

