@course
Feature: Managing courses
  In order to manage a school course
  As a user member of an organization
  I should be able to create, edit, view or delete the courses from my organization

  Scenario: Creating an course with minimum required attributes
    Given there is an academic calendar with ID '1e4d6e1f-80af-49ff-9f7a-5ffd4230ab3d'
    When I request POST academic-calendars/1e4d6e1f-80af-49ff-9f7a-5ffd4230ab3d/courses with the payload:
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
    Given there is a course with ID '03818d84-75fc-40d0-aa74-343c35fce55e'
    And there is a course with ID '452de058-a5bb-4976-89e8-f3150cb59c24'
    When I request GET /courses/
    Then I get a 200 response
    And there are 2 courses in the response

  Scenario: Listing courses by manager
    Given there is a course with ID '03818d84-75fc-40d0-aa74-343c35fce55e'
    And there is a 'manager' with ID 'd9cf7a8f-ebdf-4ce5-861e-a54a1c674e25'
    And there is a course with ID '452de058-a5bb-4976-89e8-f3150cb59c24'
    When I request GET /managers/d9cf7a8f-ebdf-4ce5-861e-a54a1c674e25/courses
    Then I get a 200 response
    And there are 1 courses in the response
    And the course with ID "452de058-a5bb-4976-89e8-f3150cb59c24" is included in the response

  Scenario: Viewing single course
    Given there is a course with ID '0939824e-dff4-47c4-b5bf-e9e697826e4b'
    When I request GET /courses/0939824e-dff4-47c4-b5bf-e9e697826e4b
    Then I get a 200 response
    And the course is included in the response

  Scenario: Updating course
    Given there is a course with ID '17208a19-eb69-4dec-95fc-baa5be2443a5'
    When I request PUT /courses/17208a19-eb69-4dec-95fc-baa5be2443a5 with the payload:
      """
      {
        "name": "2B"
      }
      """
    Then I get a 200 response
    And the course is included in the response
    And the course name is now "2B"

  Scenario: Updating an course that not exists
    And there is a course with ID 'f6dd2636-d392-419d-a1da-c0e5c8855f00'
    When I request PUT /courses/4fde4dd5-3fa1-4b67-b5df-cbae7c9895c3 with the payload:
      """
      {
        "name": "2d"
      }
      """
    Then I get a 404 response

  Scenario: Deleting courses
    Given there is a course with ID '31b3f1be-b6d1-4d86-a6aa-082fafb0685f'
    When I request DELETE /courses/31b3f1be-b6d1-4d86-a6aa-082fafb0685f
    Then I get a 204 response
    And the course was removed
