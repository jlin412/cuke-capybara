#@javascript
Feature: Test



  Scenario: Create user account
    Given I go to home website
    When I create a new user account with email "test@test.com", password "test", and confirm password "test"
    Then I shall see "Order a pizza"





  Scenario: Order a pizza with multiple toppings
    When I login with username "test@test.com" and password "test"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And I create a pending order with pizza name "ordered_toppings" with size "Medium"
    Then I shall see "Order this pizza"
    And I shall see "ordered_toppings"
    And I shall see "Medium"
    When I add a new topping name "First Topping" without double order
    Then I shall see "First Topping"
    And last topping is without double order
    When I add a new topping name "Second Topping" with double order
    Then I shall see "Second Topping"
    And last topping is with double order
    When I follow "Order this pizza"
    Then I shall see "ordered_toppings"
    And I shall see "Medium"
    And number of toppings in last order is "2"
    And last pizza order is placed