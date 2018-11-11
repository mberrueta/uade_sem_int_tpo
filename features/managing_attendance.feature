@attendance
Feature: Managing attendances
  In order to manage the students attendance
  As a manager of an organization
  I should be able to create, edit, view or delete the attendances from my students

  Scenario: Creating an attendance with minimum required attributes
    Given there is a course with ID 'bad3cc0a-06c2-41b4-8800-240111f7465f'
    And there is a 'student' with ID 'af20ef75-87c7-4b81-b7b1-5fe110ff0a82'
    When I request POST courses/bad3cc0a-06c2-41b4-8800-240111f7465f/attendances with the payload:
      """
      {
          "date": "2020-10-31",
          "present_code": "half",
          "student_id": "af20ef75-87c7-4b81-b7b1-5fe110ff0a82"
      }
      """
    Then I get a 200 response
    And the attendance has been created
    And the attendance is included in the response
    #  "present_code": "full|half"

  Scenario: Listing attendances by course and date
    Given there is an attendance with ID '7dc241af-8d82-4195-8399-c77e5d7dbd78'
    And there is a 'course' with ID 'd9cf7a8f-ebdf-4ce5-861e-a54a1c674e25'
    And there is an attendance with ID '922a1b25-d309-4935-8965-faaeba9b4520' in the date '2019-10-29'
    And there is an attendance with ID 'bcdcfc12-5672-4dd6-bac8-8deeec764eae' in the date '2019-10-30'
    And there is a 'student' with ID 'ba621fcb-1677-4ab2-ab2d-119698ee15e3'
    And there is an attendance with ID 'dc2f9dd0-480e-4dbc-9678-59d08a44c4e2' in the date '2019-10-30'
    When I request GET /courses/d9cf7a8f-ebdf-4ce5-861e-a54a1c674e25/attendances?date=2019-10-30
    Then I get a 200 response
    And there are 2 attendances in the response

  Scenario: Listing attendances by student and date
    Given there is an attendance with ID 'a2ee61d5-623e-47c6-9302-1013d7561476'
    And there is a 'course' with ID 'd9cf7a8f-ebdf-4ce5-861e-a54a1c674e25'
    And there is an attendance with ID '922a1b25-d309-4935-8965-faaeba9b4520' in the date '2019-10-29'
    And there is an attendance with ID 'bcdcfc12-5672-4dd6-bac8-8deeec764eae' in the date '2019-10-30'
    And there is a 'student' with ID 'ba621fcb-1677-4ab2-ab2d-119698ee15e3'
    And there is an attendance with ID 'dc2f9dd0-480e-4dbc-9678-59d08a44c4e2' in the date '2019-10-30'
    When I request GET /courses/d9cf7a8f-ebdf-4ce5-861e-a54a1c674e25/attendances?date=2019-10-30
    Then I get a 200 response
    And there are 2 attendances in the response

  Scenario: Listing attendances by course
    Given there is an attendance with ID '7dc241af-8d82-4195-8399-c77e5d7dbd78'
    And there is a 'course' with ID 'd9cf7a8f-ebdf-4ce5-861e-a54a1c674e25'
    And there is an attendance with ID '922a1b25-d309-4935-8965-faaeba9b4520' in the date '2019-10-29'
    And there is an attendance with ID 'bcdcfc12-5672-4dd6-bac8-8deeec764eae' in the date '2019-10-30'
    And there is a 'student' with ID 'ba621fcb-1677-4ab2-ab2d-119698ee15e3'
    And there is an attendance with ID 'dc2f9dd0-480e-4dbc-9678-59d08a44c4e2' in the date '2019-10-30'
    When I request GET /courses/d9cf7a8f-ebdf-4ce5-861e-a54a1c674e25/attendances
    Then I get a 200 response
    And there are 3 attendances in the response

  Scenario: Listing attendances by student
    Given there is an attendance with ID '7dc241af-8d82-4195-8399-c77e5d7dbd78'
    And there is a 'course' with ID 'd9cf7a8f-ebdf-4ce5-861e-a54a1c674e25'
    And there is an attendance with ID '922a1b25-d309-4935-8965-faaeba9b4520' in the date '2019-10-29'
    And there is an attendance with ID 'bcdcfc12-5672-4dd6-bac8-8deeec764eae' in the date '2019-10-30'
    And there is a 'student' with ID 'ba621fcb-1677-4ab2-ab2d-119698ee15e3'
    And there is an attendance with ID 'dc2f9dd0-480e-4dbc-9678-59d08a44c4e2' in the date '2019-10-30'
    When I request GET /courses/d9cf7a8f-ebdf-4ce5-861e-a54a1c674e25/attendances
    Then I get a 200 response
    And there are 3 attendances in the response

  Scenario: Viewing single attendance
    Given there is an attendance with ID '0939824e-dff4-47c4-b5bf-e9e697826e4b'
    When I request GET /attendances/0939824e-dff4-47c4-b5bf-e9e697826e4b
    Then I get a 200 response
    And the attendance is included in the response

  Scenario: Updating attendance
    Given there is an attendance with ID '17208a19-eb69-4dec-95fc-baa5be2443a5'
    When I request PUT /attendances/17208a19-eb69-4dec-95fc-baa5be2443a5 with the payload:
      """
      {
          "present_code": "full"
      }
      """
    Then I get a 200 response
    And the attendance is included in the response
    And the attendance present_code is now "full"

  Scenario: Updating an attendance that not exists
    And there is an attendance with ID 'f6dd2636-d392-419d-a1da-c0e5c8855f00'
    When I request PUT /attendances/4fde4dd5-3fa1-4b67-b5df-cbae7c9895c3 with the payload:
      """
      {
        "present_code": "full"
      }
      """
    Then I get a 404 response

  Scenario: Deleting attendances
    Given there is an attendance with ID '31b3f1be-b6d1-4d86-a6aa-082fafb0685f'
    When I request DELETE /attendances/31b3f1be-b6d1-4d86-a6aa-082fafb0685f
    Then I get a 204 response
    And the attendance was removed
