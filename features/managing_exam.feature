@exam
Feature: Managing exams
  In order to manage a school exam
  As a user member of an organization
  I should be able to create, edit, view or delete the exams from my organization

  Scenario: Creating an exam with minimum required attributes
    Given there is a subject with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST subjects/dc1750e0-968d-44dc-b131-4fd3fc3f7233/exams with the payload:
      """
      {
          "title": "some exam"
      }
      """
    Then I get a 200 response
    And the exam has been created
    And the exam is included in the response

  Scenario: Listing exams
    Given there is an exam with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is an exam with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /exams/
    Then I get a 200 response
    And there are 2 exams in the response

  Scenario: Viewing single exam
    Given there is an exam with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request GET /exams/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the exam is included in the response

  Scenario: Updating exam
    Given there is an exam with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /exams/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "title": "some exam"
      }
      """
    Then I get a 200 response
    And the exam is included in the response
    And the exam title is now "some exam"

  Scenario: Updating an exam that not exists
    And there is an exam with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /exams/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "title": "some exam"
      }
      """
    Then I get a 404 response

  Scenario: Deleting exams
    Given there is an exam with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /exams/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the exam was removed
