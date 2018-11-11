@exam
Feature: Managing exams
  In order to manage a school exam
  As a user member of an organization
  I should be able to create, edit, view or delete the exams from my organization

  Scenario: Creating an exam with minimum required attributes
    Given there is a lesson with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST lessons/dc1750e0-968d-44dc-b131-4fd3fc3f7233/exams with the payload:
      """
      {
          "title": "some exam"
      }
      """
    Then I get a 200 response
    And the exam has been created
    And the exam is included in the response

  Scenario: Listing exams
    Given there is a lesson with ID '3c238286-43d7-493d-90f7-93e21cf887a9'
    And there is a lesson with ID 'cc30e10e-2fff-4542-bb27-f68566e5bfc5'
    When I request GET /exams/
    Then I get a 200 response
    And there are 2 exams in the response

  Scenario: Listing exams by lesson
    Given there is a lesson with ID '58545799-ef74-43b7-bc25-eebab25c7f2f'
    And there is a lesson with ID '561081b0-b460-44d9-af91-b5689a303b47'
    When I request GET /lessons/58545799-ef74-43b7-bc25-eebab25c7f2f/exams/
    Then I get a 200 response
    And there are 1 exams in the response

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
