@lesson
Feature: Managing lessons
  In order to manage a school lesson
  As a user member of an organization
  I should be able to create, edit, view or delete the lessons from my organization

  Scenario: Creating an lesson with minimum required attributes
    Given there is a 'teacher' with ID '3a20b9d7-4b24-45bd-9dc1-b52731237f8e'
    And there is a subject with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST subjects/dc1750e0-968d-44dc-b131-4fd3fc3f7233/lessons with the payload:
      """
      {
          "date": "20191001",
          "class_number": 2,
          "title": "A cool lesson"
      }
      """
    Then I get a 200 response
    And the lesson has been created
    And the lesson is included in the response
    And the lesson teacher_id is now "3a20b9d7-4b24-45bd-9dc1-b52731237f8e"

  Scenario: Listing lessons
    Given there is a lesson with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a lesson with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /lessons/
    Then I get a 200 response
    And there are 2 lessons in the response

  Scenario: Listing lessons by teacher
    Given there is a lesson with ID '44d30604-93a0-4ded-ae8b-2a8dd736eadd'
    And there is a 'teacher' with ID 'bf4288f7-bbe2-4297-a166-3026be601475'
    And there is a subject with ID '53b31314-6290-43ad-85f0-f10e5407fc3f'
    And there is a lesson with ID '2f34e1f3-94d3-47c7-a2bc-4ad54a832f97'
    When I request GET /teachers/bf4288f7-bbe2-4297-a166-3026be601475/lessons/
    Then I get a 200 response
    And there are 1 lessons in the response

  Scenario: Listing lessons by subject
    Given there is a lesson with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a subject with ID 'c6ee3586-0be0-48aa-823d-5b29c420816b'
    And there is a lesson with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET subjects/c6ee3586-0be0-48aa-823d-5b29c420816b/lessons/
    Then I get a 200 response
    And there are 1 lessons in the response

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
