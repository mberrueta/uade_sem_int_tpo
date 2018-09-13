@course
Feature: Managing courses
  In order to manage a school course
  As a user member of an organization
  I should be able to create, edit, view or delete the courses from my organization

  Scenario: Creating an course with minimum required attributes
    Given there is an academic calendar with ID 3
    When I request POST academic-calendars/3/courses with the payload:
      """
      {
          "name": "1A",
          "max_students": 20
      }
      """
    Then I get a 200 response
    And the course has been created
    And the course is included in the response

  Scenario: Listing courses
    Given there is an course with ID 10
    And there is an course with ID 12
    When I request GET /courses/
    Then I get a 200 response
    And there are 2 courses in the response

  Scenario: Viewing single course
    Given there is an course with ID 13
    When I request GET /courses/13
    Then I get a 200 response
    And the course is included in the response
    And there is an course with ID 10

  Scenario: Updating course
    Given there is an course with ID 10
    When I request PUT /courses/10 with the payload:
      """
      {
        "name": "2B"
      }
      """
    Then I get a 200 response
    And the course is included in the response
    And the course name is now "2B"

  Scenario: Updating an course that not exists
    And there is an course with ID 12
    When I request PUT /courses/14 with the payload:
      """
      {
        "name": "2d"
      }
      """
    Then I get a 404 response

  Scenario: Deleting courses
    Given there is an course with ID 13
    When I request DELETE /courses/13
    Then I get a 204 response
    And the course was removed
