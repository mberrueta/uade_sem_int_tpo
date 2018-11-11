@student_exam
Feature: Managing student exams
  In order to manage a school student exam
  As a user member of an organization
  I should be able to create, edit, view or delete the exams for my student

  Scenario: Creating an student exam with minimum required attributes
    Given there is a 'student' with ID '2bd474fc-07a4-4af3-a5a8-8befec1bda9e'
    And there is an exam with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request POST students/2bd474fc-07a4-4af3-a5a8-8befec1bda9e/student-exams with the payload:
      """
      {
          "exam_id": "76ff8ffc-e643-443d-aa87-9ec344317f65"
      }
      """
    Then I get a 200 response
    And the student exam has been created
    And the student exam is included in the response

  Scenario: Listing student exams
    Given there is a student exam with ID '03818d84-75fc-40d0-aa74-343c35fce55e'
    And there is a student exam with ID '452de058-a5bb-4976-89e8-f3150cb59c24'
    When I request GET /student-exams/
    Then I get a 200 response
    And there are 2 student exams in the response

  Scenario: Listing student exams by student
    Given there is a student exam with ID '03818d84-75fc-40d0-aa74-343c35fce55e'
    And there is a 'student' with ID 'd9cf7a8f-ebdf-4ce5-861e-a54a1c674e25'
    And there is a student exam with ID '452de058-a5bb-4976-89e8-f3150cb59c24'
    And there is a student exam with ID '4688847a-861a-4fd9-a1b2-7c76d8accd1e'
    When I request GET /students/d9cf7a8f-ebdf-4ce5-861e-a54a1c674e25/student-exams
    Then I get a 200 response
    And there are 2 student exams in the response
    And the student exam with ID "452de058-a5bb-4976-89e8-f3150cb59c24" is included in the response

  Scenario: Listing exams by lesson
    Given there is a 'student' with ID 'ccc54dc3-32a3-49e7-85e9-929038387529'
    And there is a lesson with ID '713f50cb-3eb1-411e-be9d-2c794387dd9c'
    And there is a lesson with ID 'cb25947b-704d-49b8-8e03-c2974526ff8b'
    And the student has pending the exam for the lesson with ID '713f50cb-3eb1-411e-be9d-2c794387dd9c'
    And the student has made the exam for the lesson with ID 'cb25947b-704d-49b8-8e03-c2974526ff8b'
    When I request GET lessons/cb25947b-704d-49b8-8e03-c2974526ff8b/student-exams
    Then I get a 200 response
    And there are 1 exams in the response

  Scenario: Listing exams by student & lesson
    Given there is a 'student' with ID 'ccc54dc3-32a3-49e7-85e9-929038387529'
    And there is a lesson with ID '713f50cb-3eb1-411e-be9d-2c794387dd9c'
    And there is a lesson with ID 'cb25947b-704d-49b8-8e03-c2974526ff8b'
    And the student has pending the exam for the lesson with ID '713f50cb-3eb1-411e-be9d-2c794387dd9c'
    And the student has made the exam for the lesson with ID 'cb25947b-704d-49b8-8e03-c2974526ff8b'
    And there is a student exam with ID '452de058-a5bb-4976-89e8-f3150cb59c24'
    And there is a student exam with ID '4688847a-861a-4fd9-a1b2-7c76d8accd1e'
    And there is a 'student' with ID '07c247a7-da81-4524-80a5-30218d774c8a'
    And there is a lesson with ID '71a77273-39de-45e6-b243-066dbc0eb658'
    And there is a lesson with ID '89705550-4fe2-4103-aefd-b434279a2dca'
    And there is a student exam with ID '5d4cbfb7-70a4-4709-aa27-b215d5eab5d2'
    And there is a student exam with ID 'a2dde719-4da6-47bc-85d7-3bf0d7b91ca2'
    And the student has pending the exam for the lesson with ID '71a77273-39de-45e6-b243-066dbc0eb658'
    When I request GET students/ccc54dc3-32a3-49e7-85e9-929038387529/student-exams?lesson_id=cb25947b-704d-49b8-8e03-c2974526ff8b
    Then I get a 200 response
    And there are 1 exams in the response

  Scenario: Viewing single student_exam
    Given there is a student exam with ID '0939824e-dff4-47c4-b5bf-e9e697826e4b'
    When I request GET /student-exams/0939824e-dff4-47c4-b5bf-e9e697826e4b
    Then I get a 200 response
    And the student exam is included in the response

  Scenario: Updating student_exam
    Given there is a student exam with ID '17208a19-eb69-4dec-95fc-baa5be2443a5'
    When I request PUT /student-exams/17208a19-eb69-4dec-95fc-baa5be2443a5 with the payload:
      """
      {
        "questions_to_show": 4
      }
      """
    Then I get a 200 response
    And the student exam is included in the response

  Scenario: Updating an student exam that not exists
    And there is a student exam with ID 'f6dd2636-d392-419d-a1da-c0e5c8855f00'
    When I request PUT /student-exams/4fde4dd5-3fa1-4b67-b5df-cbae7c9895c3 with the payload:
      """
      {
        "questions_to_show": 4
      }
      """
    Then I get a 404 response

  Scenario: Deleting student_exams
    Given there is a student exam with ID '31b3f1be-b6d1-4d86-a6aa-082fafb0685f'
    When I request DELETE /student-exams/31b3f1be-b6d1-4d86-a6aa-082fafb0685f
    Then I get a 204 response
    And the student exam was removed
