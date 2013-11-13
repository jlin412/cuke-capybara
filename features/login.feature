Feature: Login
  Test User login


  Scenario: Setup an user for this feature
    Given I go to home website
    When I create a new user account with email "login@login.com", password "abcd", and confirm password "abcd"
    Then I shall see "Order a pizza"

  Scenario: Attempt to login with all empty fields
    When I login with username "" and password ""
    Then I shall see "You did not provide any details for authentication."

  Scenario Outline: Attempt to login with bad or wrong email
    When I login with username "<email>" and password "<password>"
    Then I shall see "<error>"
  Examples:
    | email                 | password | error                                |
    |                       | abcd     | Email cannot be blank                     |
    | non-existing@login.com | abcd     | Email is not valid                        |

  Scenario Outline: Login with good email form
    When I login with username "<email>" and password "<password>"
    Then I shall see "<validation>"
  Examples:
    | email                 | password | validation |
    | login@login.com         | abcd     | Order a pizza      |
    | LOGIN@login.COM         | abcd     | Order a pizza      |

  Scenario Outline: Attempt to login with wrong passwords
    When I login with username "<email>" and password "<password>"
    Then I shall see "<error>"
  Examples:
    | email                 | password  |  error |
    | login@login.com         |           | Password cannot be blank  |
    | login@login.com         | wrongPass     | Password is not valid     |
    | login@login.com        | ABCD      | Password is not valid     |





