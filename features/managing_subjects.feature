@subject
Feature: Managing subjects
  In order to manage a school subject
  As a user member of an organization
  I should be able to create, edit, view or delete the subjects from my organization

  Scenario: Creating a subject with minimum required attributes
    Given there is an course with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST courses/dc1750e0-968d-44dc-b131-4fd3fc3f7233/subjects with the payload:
      """
      {
          "name": "1A"
      }
      """
    Then I get a 200 response
    And the subject has been created
    And the subject is included in the response

  Scenario: Listing subjects
    Given there is a subject with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a subject with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /subjects/
    Then I get a 200 response
    And there are 2 subjects in the response

  Scenario: Viewing single subject
    Given there is a subject with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request GET /subjects/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the subject is included in the response

  Scenario: Updating subject
    Given there is a subject with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /subjects/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "name": "2B"
      }
      """
    Then I get a 200 response
    And the subject is included in the response
    And the subject name is now "2B"

  Scenario: Updating a subjectthat not exists
    And there is a subject with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /subjects/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "name": "2d"
      }
      """
    Then I get a 404 response

  Scenario: Deleting subjects
    Given there is a subject with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /subjects/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the subject was removed
