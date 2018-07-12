Feature: MileagePlus Sign in

  Background:
    Given I am in united airlines homepage
    When I click on the top header sign in link
    And I choose 'sign in' feature

  Scenario Outline: Sign in negative tests
    And I fill in mileageplus <number>
    And I fill in the mileageplus <password>
    Then I click the sign in button
    Then the result should be <string> on the screen
    Examples:
    | number | password | string|
    # (test case #14: invalid number, correct password)
    | 12345            | password| The account information you entered is not valid.|
    # (test case #15: invalid input chars and length, correct password)
    | YT#$%^&*()GHJKKB | password| The account information you entered is not valid.|
    # (test case #16: empty string for mileage number, correct password)
    |                  | password| Please sign in using your MileagePlus number and password or PIN.|
    # (test case #16: correct mileage number, empty string for password)
    | T12345           |         | Please enter your password or PIN.|
    # (test case #17: SQL Injection)
    | 105 OR 1=1       | 105 OR 1=1 | Please enter a valid MileagePlus number.|
    # (test case #17: XSS vulnerability)
    | <script>alert(123)</script> | password | Please enter a valid MileagePlus number.|


