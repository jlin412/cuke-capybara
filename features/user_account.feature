Feature: User Account
  Test User account creation and update

  Background:
    Given I go to home website

  Scenario: Attempt to create user with all empty fields

    When I create a new user account with email "", password "", and confirm password ""
    Then I shall see "Email should look like an email address."
    And I shall see "Password is too short (minimum is 4 characters)"
    And I shall see "Password doesn't match confirmation"
    And I shall see "Password confirmation is too short (minimum is 4 characters)"


  Scenario Outline: Attempt to create user with bad email
    When I create a new user account with email "<email>", password "<password>", and confirm password "<confirm>"
    Then I shall see "<error>"
  Examples:
    | email                 | password | confirm  | error |
    |                       | 1234     | 1234     | Email should look like an email address.  |
    | noat.com              | 1234     | 1234     | Email should look like an email address.  |
    | twoat@@useraccount.com       | 1234     | 1234     | Email should look like an email address.  |
    | @useraccount.com             | 1234     | 1234     | Email should look like an email address.  |
    | noend@                | 1234     | 1234     | Email should look like an email address.  |
    | twodots@useraccount..com     | 1234     | 1234     | Email should look like an email address.  |
    | enddot.@useraccount.com      | 1234     | 1234     | Email should look like an email address.  |

  Scenario Outline: Create user with good email form
    When I create a new user account with email "<email>", password "<password>", and confirm password "<confirm>"
    Then I shall see "<validation>"
  Examples:
    | email                 | password | confirm  | validation      |
    | jlin@useraccount.com         | 1234     | 1234 | Order a pizza      |
    | CAP@useraccount.COM         | 1234     | 1234 | Order a pizza      |
    | john.doe@useraccount.com     | 1234     | 1234 | Order a pizza      |
    | john-doe@useraccount.com     | 1234     | 1234 | Order a pizza      |
    | john_doe@useraccount.com     | 1234     | 1234 | Order a pizza      |
    | jlin+user1@useraccount.com   | 1234     | 1234 | Order a pizza      |


  Scenario Outline: Attempt to create user with bad passwords
    When I create a new user account with email "<email>", password "<password>", and confirm password "<confirm>"
    Then I shall see "<error>"
  Examples:
    | email                 | password | confirm   | error |
    | jlin1@useraccount.com         | 123     | 123       | Password is too short (minimum is 4 characters) |
    | jlin2@useraccount.com         |         |           | Password is too short (minimum is 4 characters) |
    | jlin3@useraccount.com         | 1234    |           | Password confirmation is too short (minimum is 4 characters) |
    | jlin4@useraccount.com         |         | 1234      | Password is too short (minimum is 4 characters) |
    | jlin5@useraccount.com         | 1234    | 12345     | Password doesn't match confirmation |
    | jlin6@useraccount.com         | abcd    | ABCD      | Password doesn't match confirmation |

  Scenario Outline: Create user with good passwords
    When I create a new user account with email "<email>", password "<password>", and confirm password "<confirm>"
    Then I shall see "<validation>"

  Examples:
    | email                 | password                            | confirm                             | validation |
    | jlin7@useraccount.com         | 1234                               | 1234                                | Order a pizza |
    | jlin8@useraccount.com         | 12 34                              | 12 34                                | Order a pizza |
    | jlin9@useraccount.com         | Aa~!@#$%^&*()_+-=<>,.              | Aa~!@#$%^&*()_+-=<>,.                 | Order a pizza |
    | jlin10@useraccount.com        | abcdefghijklmnopqstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ | abcdefghijklmnopqstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ | Order a pizza |


  Scenario: attempt to create duplicate users accounts
    When I create a new user account with email "jlin@useraccount.com", password "1234", and confirm password "1234"
    Then I shall see "Email has already been taken"

  Scenario: To update password of existing user.  The user is no longer able to useraccount with old password but new password
    When I create a new user account with email "password@useraccount.com", password "4321", and confirm password "4321"
    Then I shall see "Order a pizza"
    Given I update user account with email "password@useraccount.com", password "4321", and confirm password "4321"
    Then I shall see "Order a pizza"
    When I login with username "password@useraccount.com" and password "1234"
    Then I shall see "Password is not valid"
    When I login with username "password@useraccount.com" and password "4321"
    Then I shall see "Order a pizza"

  Scenario: Update user email.  Old email address can't login any longer but new email can.
    When I create a new user account with email "email@useraccount.com", password "1234", and confirm password "1234"
    Then I shall see "Order a pizza"
    Given I update user account with email "updated.email@useraccount.com", password "1234", and confirm password "1234"
    Then I shall see "Order a pizza"
    When I login with username "email@useraccount.com" and password "1234"
    Then I shall see "Email is not valid"
    When I login with username "updated.email@useraccount.com" and password "1234"
    Then I shall see "Order a pizza"

  Scenario: update user email and password together.  Old email and password are no longer valid.  Only new email/password combination is able to login.
    When I create a new user account with email "email.password@login.com", password "1234", and confirm password "1234"
    Then I shall see "Order a pizza"
    Given I update user account with email "updated.email.password@login.com", password "4321", and confirm password "4321"
    Then I shall see "Order a pizza"
    When I login with username "email.password@login.com" and password "1234"
    Then I shall see "Email is not valid"
    When I login with username "updated.email.password@login.com" and password "4321"
    Then I shall see "Order a pizza"