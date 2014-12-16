Feature: Create a new order
  In order to users can create a new order on the service
  Order may be created by registered users and guests
  Describe only verbal orders, because mechanism for the creation of other orders of the same

  Background:
    And object of "language" with name: "Russian"
    And object of "language" with name: "Mumbu-umbu"

  Scenario Outline:
    When I go to "/"
     And I click on link "<order_type>"
    Then I should see form for new "<order_type>" order
  Examples:
    | order_type |
    | verbal     |
    | writing    |
    | local |


#  Scenario: Change step
#    When I go to "/"
#     And I click on link "create verbal order"
#     And I filled all inputs correct data
#     And I click to a button "continue"
#    Then I should see form for create orders 2nd step
#     And the new order was persist on store
#     And the new order has step equals "1"
#
#  Scenario: Redirect to the current steps
#    Given a in_progress order with current step "1" for current session
#    When I go to "/orders/new"
#    Then I should see form for create orders 2nd step
#
#
