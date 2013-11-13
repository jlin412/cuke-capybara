Feature: To testing ordering pizza, add toppings, and removing toppings or pizza

  Scenario: Setup an user for this feature
    Given I go to home website
    When I create a new user account with email "pizza_order@demo.com", password "1234", and confirm password "1234"
    Then I shall see "Order a pizza"

  Scenario: Create a pending pizza order
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And I create a pending order with pizza name "pending" with size "large"
    Then I shall see "Order this pizza"
    And I shall see "pending"
    And I shall see "large"
    When I follow "All orders"
    Then I shall see "pending"
    And I shall see "large"
    And last pizza order is not placed yet



  Scenario: Update a pending pizza order
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And I create a pending order with pizza name "pending1" with size "large"
    Then I shall see "Order this pizza"
    When I follow "All orders"
    When I update last order with pizza name "update" with size "small"
    And I shall see "update"
    And I shall see "small"
    When I follow "All orders"
    Then I shall see "update"
    And I shall see "small"
    And last pizza order is not placed yet



  Scenario: Order a pizza without toppings
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And I create a pending order with pizza name "ordered" with size "Super size"
    Then I shall see "Order this pizza"
    And I shall see "ordered"
    And I shall see "Super size"
    When I follow "Order this pizza"
    Then I shall see "ordered"
    And I shall see "Super size"
    And last pizza order is placed

  Scenario: Order a pizza with multiple toppings
    When I login with username "pizza_order@demo.com" and password "1234"
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

  Scenario: Order a pizza with the same name and size
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And I create a pending order with pizza name "dup_name" with size "dup_size"
    Then I shall see "Order this pizza"
    And I shall see "dup_name"
    And I shall see "dup_size"
    When I follow "Order this pizza"
    And I shall see "Place another order"
    When I follow "Place another order"
    And I create a pending order with pizza name "dup_name" with size "dup_size"
    Then I shall see "Order this pizza"
    And I shall see "dup_name"
    And I shall see "dup_size"
    When I follow "Order this pizza"
    Then last pizza order is placed
    And last pizza order is with pizza name "dup_name" with size "dup_size"
    # check for two orders


  Scenario: Remove a pending order
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And I create a pending order with pizza name "remove_pizza" with size "remove_size"
    Then I shall see "Order this pizza"
    And I shall see "remove_pizza"
    And I shall see "remove_size"
    When I follow "All orders"
    Then I shall see "remove_pizza"
    And I shall see "remove_size"
    And last pizza order is not placed yet
    When I remove last order
    Then I shall not see "remove_pizza"
    And I shall not see "remove_size"
    And I shall see "Place another order"

  Scenario: Remove topping of a pending order
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    And  I create a pending order with pizza name "remove_topping" with size "remove_top_size"
    Then I shall see "Order this pizza"
    And I shall see "remove_topping"
    And I shall see "remove_top_size"
    When I add a new topping name "First Topping" without double order
    Then I shall see "First Topping"
    And last topping is without double order
    When I add a new topping name "Second Topping" with double order
    Then I shall see "Second Topping"
    And last topping is with double order
    And I remove last topping
    Then I shall not see "Second Topping"
    And I shall see "All orders"
    When I follow "All orders"
    Then number of toppings in last order is "1"

  Scenario: Attempt to update an pizza order after it is ordered using url targeting
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    When I create a pending order with pizza name "url_edit" with size "url_edit_size"
    Then I shall see "Order this pizza"
    And I shall see "url_edit"
    And I shall see "url_edit_size"
    When I follow "Order this pizza"
    Then I shall see "url_edit"
    And I shall see "url_edit_size"
    And last pizza order is placed
    When I display last pizza order detail
    And I go to edit page of detail order
    Then I shall not see "Editing pizza"

  Scenario: Attempt to create a pending pizza order with empty fields
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    When I create a pending order with pizza name "" with size ""
    And I shall see "Editing pizza"
    Then I shall not see "Order this pizza"

  Scenario: Attempt to add topping with empty field
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    When I create a pending order with pizza name "empty_topping" with size "empty_topping_size"
    Then I shall see "Order this pizza"
    And I shall see "empty_topping"
    And I shall see "empty_topping_size"
    When I add a new topping name "" without double order
    Then I shall see "New topping"
    Then I shall not see " Order this pizza"

  Scenario: Attempt to html tag injection attack in pizza name
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    When I create a pending order with pizza name "<b>bold</b>" with size "<I>Italic size</I>"
    Then I shall see "Order this pizza"
    And I shall see "<b>bold</b>"
    And I shall see "<I>Italic size</I>"
    When I follow "Order this pizza"
    And I shall see "Place another order"
    And I shall see "<b>bold</b>"
    And I shall see "<I>Italic size</I>"

  Scenario: Attempt to Javascript injection attack in pizza name and topping size
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    When I create a pending order with pizza name "<script> document.write('<p>Script Pizza Name</p>'); </script>" with size "<script> document.write('<p>Script Pizza Size</p>'); </script>"
    Then I shall see "Order this pizza"
    And I shall see "<p>Script Pizza Name</p>"
    And I shall see "<p>Script Pizza Size</p>"
    When I follow "Order this pizza"
    And I shall see "Place another order"
    And I shall see "<p>Script Pizza Name</p>"
    And I shall see "<p>Script Pizza Size</p>"

  Scenario Outline: Order a pizza with special characters (symbols and international characters
    When I login with username "pizza_order@demo.com" and password "1234"
    Then I shall see "Order a pizza"
    When I follow "Order a pizza"
    When I create a pending order with pizza name "<name>" with size "<size>"
    Then I shall see "Order this pizza"
    And I shall see "<name>"
    And I shall see "<size>"
    When I follow "Order this pizza"
    And I shall see "Place another order"
    And I shall see "<name>"
    And I shall see "<size>"
   Examples:
    | name | size |
    | àèìòù | ÂÊÎÔÛ |
    | ,$+-~!#$%&*.,';: |&*.,';:,$+-~!#$% |
