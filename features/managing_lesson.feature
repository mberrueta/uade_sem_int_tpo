@lesson
Feature: Managing lessons
  In order to manage a school lesson
  As a user member of an organization
  I should be able to create, edit, view or delete the lessons from my organization

  Scenario: Creating an lesson with minimum required attributes
    Given there is a subject with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST subjects/dc1750e0-968d-44dc-b131-4fd3fc3f7233/lessons with the payload:
      """
      {
          "date": "20191001",
          "class_number": 2
      }
      """
    Then I get a 200 response
    And the lesson has been created
    And the lesson is included in the response
And pretty print the response
    
  Scenario: Listing lessons
    Given there is a lesson with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a lesson with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /lessons/
    Then I get a 200 response
    And there are 2 lessons in the response

  Scenario: Viewing single lesson
    Given there is a lesson with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    And there is a topic with ID "90555acb-abe1-4429-8203-661b2c66bce1"
    And there is a topic with ID "2db21b3a-a434-428f-bac9-1d673a4c01d7"
    When I request GET /lessons/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the lesson is included in the response

  Scenario: Updating lesson
    Given there is a lesson with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /lessons/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "date": "2019-10-01"
      }
      """
    Then I get a 200 response
    And the lesson is included in the response
    And the lesson date is now "2019-10-01"

  Scenario: Updating an lesson that not exists
    And there is a lesson with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /lessons/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "date": "20191001"
      }
      """
    Then I get a 404 response

  Scenario: Deleting lessons
    Given there is a lesson with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /lessons/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the lesson was removed
