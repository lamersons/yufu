Feature: Manage orders

  Background:
    Given a translator with email: "translator@example.com", and password: "password"
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

  Scenario: Assign as secondary
    Given a new verbal order from client "client@example.com" with status: "paid"
    When I go to "/user"
    And I click to "my_orders"
    And I click to "create_secondary_application"
    Then An application for order from client "client@example.com" assigned to "translator@example.com" should be created
    But The order from client "client@example.com" should not have status "in_progress"



  Scenario: Show new orders
    Given a new verbal order from client "client@example.com" with status: "paid"
    When I go to "/user"
    And I click to "my_orders"
    Then I should see "1" order


  Scenario: Show in_progress orders
    Given a new verbal order from client "client@example.com" with status: "paid"
      And a new verbal order from client "client@example.com" with status: "in_progrss", assignee_to "translator@example.com"
    When I go to "/user"
     And I click to "my_orders"
     And I click to "in_progress_orders"
    Then I should see "1" order

  Scenario: Show closed orders
    Given a new verbal order from client "client@example.com" with status: "paid"
    And a new verbal order from client "client@example.com" with status: "closed", assignee_to "translator@example.com"
    When I go to "/user"
    And I click to "my_orders"
    And I click to "closed_orders"
    Then I should see "1" order


