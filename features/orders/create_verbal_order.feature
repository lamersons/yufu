Feature: create verbal order
  Verbal order is created and all fields are filled.
  This feature checks if all the data is saved in the database.
  Background:
    Given a user with password and email "user@example.com", "password"
    And today is "01.11.2014"

  Scenario: fulfil the form on step one
    When I go to "/"
    And I select verbal translation
    And I go for create new order


