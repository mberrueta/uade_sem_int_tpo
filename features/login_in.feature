@login
Feature: Login in

Scenario: Creating a session
  Given there is a 'student' with ID '2bd474fc-07a4-4af3-a5a8-8befec1bda9e'
  And the 'student' 'dni' is '1234'
  When I request POST /login with the payload:
    """
    {
        "dni": "1234"
    }
    """
  Then I get a 200 response
  And the 'student' is included in the response

  Scenario: Creating a session fail
    Given there is a 'student' with ID '2bd474fc-07a4-4af3-a5a8-8befec1bda9e'
    And the 'student' 'dni' is '1234'
    When I request POST /login with the payload:
    """
    {
        "dni": "2133"
    }
    """
    Then I get a 404 response
  Scenario: Creating a session fail
    Given there is a 'student' with ID '2bd474fc-07a4-4af3-a5a8-8befec1bda9e'
    And the 'student' 'dni' is '1234'
    When I request POST /login with the payload:
    """
    {
    }
    """
    Then I get a 404 response

