Feature: Create a new order
  In order to users can create a new order on the service
  Order may be created by registered users and guests
  Describe only verbal orders, because mechanism for the creation of other orders of the same

  Background:
    Given default locales

  Scenario Outline:
    When I go to "/"
     And I click on link "create <order_type> order"
    Then I should see form for new <order_type> order
  Examples:
    | order_type |
    | verbal     |
    | written    |
    | local_expert |


  Scenario: Change step
    When I go to "/"
     And I click on link "create verbal order"
     And I filled all inputs correct data
     And I click to a button "continue"
    Then I should see form for create orders 2nd step
     And the new order was persist on store
     And the new order has step equals "1"

  Scenario: Redirect to the current steps
    Given a in_progress order with current step "1" for current session
    When I go to "/orders/new"
    Then I should see form for create orders 2nd step


