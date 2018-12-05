@student_answer
Feature: Managing student answers
  In order to manage a school student answer
  As a student member of an organization
  I should be able to create, edit, view or delete my answers

  Scenario: Creating an student answer with minimum required attributes
    Given there is a 'student' with ID '01d828db-7571-4d0b-b6c0-c1a934f57bf7'
    And there is an exam with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    And the exam has a question with ID '7bf9824d-3dde-4c8b-ad30-a3022423db06' and options are:
      | options           |
      | correct one       |
      | incorrect one     |
    And there is a student exam with ID '19165b3c-11fb-4a4d-898d-494c290359bd'
    When I request POST student-exams/19165b3c-11fb-4a4d-898d-494c290359bd/student-answers with the payload:
      """
      {
          "exam_question_id": "7bf9824d-3dde-4c8b-ad30-a3022423db06",
          "answer": "correct one"
      }
      """
    Then I get a 200 response
    And the student answer has been created
    And the student answer is included in the response
    And the student answer is correct

  Scenario: Creating an student answer with minimum required attributes
    Given there is a 'student' with ID '01d828db-7571-4d0b-b6c0-c1a934f57bf7'
    And there is an exam with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    And the exam has a question with ID '7bf9824d-3dde-4c8b-ad30-a3022423db06' and options are:
      | options           |
      | correct one       |
      | incorrect one     |
    And there is a student exam with ID '19165b3c-11fb-4a4d-898d-494c290359bd'
    When I request POST student-exams/19165b3c-11fb-4a4d-898d-494c290359bd/student-answers with the payload:
      """
      {
          "exam_question_id": "7bf9824d-3dde-4c8b-ad30-a3022423db06",
          "answer": "incorrect one"
      }
      """
    Then I get a 200 response
    And the student answer has been created
    And the student answer is included in the response
    And the student answer is incorrect

  Scenario: Listing student answers
    Given there is a correct student answer with ID '0d8983a5-9b72-4800-b7eb-1f67b3ffa236'
    And there is a correct student answer with ID '1d7471df-fd3c-4daf-a8f7-25a1cd05c9c7'
    When I request GET /student-answers/
    Then I get a 200 response
    And there are 2 student answers in the response

  Scenario: Listing student answers by student
    Given there is a correct student answer with ID '5715d024-b0ed-4f49-a7fd-cf988b9b2227'
    And there is a student exam with ID '8b48a1de-b057-442e-8c73-63198bb9c175'
    And there is a correct student answer with ID '0cbad0af-f0f7-44ae-8306-9e688f70cdbf'
    And there is a correct student answer with ID 'd54c0b76-ae84-40b4-a655-1857960c57f5'
    When I request GET /student-exams/8b48a1de-b057-442e-8c73-63198bb9c175/student-answers
    Then I get a 200 response
    And there are 2 student answers in the response
    And the student answer with ID "d54c0b76-ae84-40b4-a655-1857960c57f5" is included in the response

  Scenario: Viewing single student answer
    Given there is a correct student answer with ID '6f247d1b-ee0d-4f8d-b8ba-2b30ae680254'
    When I request GET /student-answers/6f247d1b-ee0d-4f8d-b8ba-2b30ae680254
    Then I get a 200 response
    And the student answer is included in the response

  Scenario: Updating student_answer
    Given there is a correct student answer with ID 'cd726100-5822-44b0-8e6c-0edfcc0297af'
    When I request PUT /student-answers/cd726100-5822-44b0-8e6c-0edfcc0297af with the payload:
      """
      {
        "questions_to_show": 4
      }
      """
    Then I get a 200 response
    And the student answer is included in the response

  Scenario: Updating an student answer that not exists
    And there is a correct student answer with ID 'f6dd2636-d392-419d-a1da-c0e5c8855f00'
    When I request PUT /student-answers/4fde4dd5-3fa1-4b67-b5df-cbae7c9895c3 with the payload:
      """
      {
        "questions_to_show": 4
      }
      """
    Then I get a 404 response

  Scenario: Deleting student_answers
    Given there is a correct student answer with ID '31b3f1be-b6d1-4d86-a6aa-082fafb0685f'
    When I request DELETE /student-answers/31b3f1be-b6d1-4d86-a6aa-082fafb0685f
    Then I get a 204 response
    And the student answer was removed
