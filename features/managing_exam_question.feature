@exam_question
Feature: Managing exam_questions
  In order to manage a school exam_question
  As a user member of an organization
  I should be able to create, edit, view or delete the exam questions from my organization

  Scenario: Creating an exam question with minimum required attributes
    Given there is an exam with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST exams/dc1750e0-968d-44dc-b131-4fd3fc3f7233/exam-questions with the payload:
      """
      {
          "question": "what is the best xx?",
          "options": [
            "option A",
            "option B",
            "option C"
          ]
      }
      """
    Then I get a 200 response
    And the exam question has been created
    And the exam question is included in the response

  Scenario: Listing exam_questions
    Given there is an exam question with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is an exam question with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /exam-questions/
    Then I get a 200 response
    And there are 2 exam_questions in the response

  Scenario: Listing questions by exam
    Given there is an exam with ID "0c2fffe6-f8c1-4d66-8c7e-4b03d11db5a1"
    And there is an exam question with ID '3567d9bb-6f54-4a2d-8d0a-ea123c766649'
    And there is an exam with ID "3d25062d-ef04-4a47-a6ce-ddd44d4b695d"
    And there is an exam question with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is an exam question with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /exams/3d25062d-ef04-4a47-a6ce-ddd44d4b695d/exam-questions/
    Then I get a 200 response
    And there are 2 exam_questions in the response

  Scenario: Viewing single exam_question
    Given there is an exam question with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request GET /exam-questions/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the exam question is included in the response

  Scenario: Updating exam_question
    Given there is an exam question with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /exam-questions/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "question": "what is the best xx?"
      }
      """
    Then I get a 200 response
    And the exam question is included in the response
    And the exam question is now "what is the best xx?"

  Scenario: Updating an exam question that not exists
    And there is an exam question with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /exam-questions/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "question": "what is the best xx?"
      }
      """
    Then I get a 404 response

  Scenario: Deleting exam_questions
    Given there is an exam question with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /exam-questions/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the exam question was removed
