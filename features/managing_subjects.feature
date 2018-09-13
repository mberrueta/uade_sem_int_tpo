@subject
Feature: Managing subjects
  In order to manage a school subject
  As a user member of an organization
  I should be able to create, edit, view or delete the subjects from my organization

  Scenario: Creating an subject with minimum required attributes
    Given there is an course with ID 3
    When I request POST courses/3/subjects with the payload:
      """
      {
          "name": "1A"
      }
      """
    Then I get a 200 response
    And the subject has been created
    And the subject is included in the response

  Scenario: Listing subjects
    Given there is an subject with ID 10
    And there is an subject with ID 12
    When I request GET /subjects/
    Then I get a 200 response
    And there are 2 subjects in the response

  Scenario: Viewing single subject
    Given there is an subject with ID 13
    When I request GET /subjects/13
    Then I get a 200 response
    And the subject is included in the response
    And there is an subject with ID 10

  Scenario: Updating subject
    Given there is an subject with ID 10
    When I request PUT /subjects/10 with the payload:
      """
      {
        "name": "2B"
      }
      """
    Then I get a 200 response
    And the subject is included in the response
    And the subject name is now "2B"

  Scenario: Updating an subject that not exists
    And there is an subject with ID 12
    When I request PUT /subjects/14 with the payload:
      """
      {
        "name": "2d"
      }
      """
    Then I get a 404 response

  Scenario: Deleting subjects
    Given there is an subject with ID 13
    When I request DELETE /subjects/13
    Then I get a 204 response
    And the subject was removed
