@student_exam_qualification
Feature: Managing student exams qualification
  In order to finish a school student exam
  As a user member of an organization
  I should be able to create, edit, view or delete the exams qualification for my student

  Scenario: Updating student_exam_qualification
    Given there is a student exam with ID '07e30f20-3eff-4fb6-9859-fb089bf3bc5e'
    And there is a student exam qualification with ID "2fca315f-d250-4271-8421-eaedc5d06c81"
    When I request PUT /student-exam-qualifications/2fca315f-d250-4271-8421-eaedc5d06c81 with the payload:
      """
      {
        "result": 4,
        "notes": "approved"
      }
      """
    Then I get a 200 response
    And the student exam qualification is included in the response
