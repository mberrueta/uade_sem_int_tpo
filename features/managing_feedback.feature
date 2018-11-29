@feedback
Feature: Managing feedback
  In order to give a feedback
  As a student member of an organization
  I should be able to create, edit, view or delete the feedback

  Scenario: Creating an feedback with minimum required attributes to a teacher
    Given there is a 'teacher' with ID '3a20b9d7-4b24-45bd-9dc1-b52731237f8e'
    Given there is a 'student' with ID '1a916d78-ed1f-4afb-9da9-7d927a7eeb51'
    When I request POST /teachers/3a20b9d7-4b24-45bd-9dc1-b52731237f8e/feedback with the payload:
      """
      {
          "student_id": "1a916d78-ed1f-4afb-9da9-7d927a7eeb51",
          "value": 2,
          "comments": "I don't like too much how the teacher explain things."
      }
      """
    Then I get a 200 response
    And the feedback has been created
    And the feedback is included in the response
    And the feedback to_id is now "3a20b9d7-4b24-45bd-9dc1-b52731237f8e"

  Scenario: Creating an feedback with minimum required attributes to a preceptor
    Given there is a 'preceptor' with ID '3a20b9d7-4b24-45bd-9dc1-b52731237f8e'
    Given there is a 'student' with ID '1a916d78-ed1f-4afb-9da9-7d927a7eeb51'
    When I request POST /preceptors/3a20b9d7-4b24-45bd-9dc1-b52731237f8e/feedback with the payload:
      """
      {
          "student_id": "1a916d78-ed1f-4afb-9da9-7d927a7eeb51",
          "value": 2,
          "comment": "I don't like too much how the teacher explain things."
      }
      """
    Then I get a 200 response
    And the feedback has been created
    And the feedback is included in the response
    And the feedback to_id is now "3a20b9d7-4b24-45bd-9dc1-b52731237f8e"

  Scenario: Creating an feedback with minimum required attributes to a lesson
    Given there is a 'lesson' with ID '3a20b9d7-4b24-45bd-9dc1-b52731237f8e'
    Given there is a 'student' with ID '1a916d78-ed1f-4afb-9da9-7d927a7eeb51'
    When I request POST /lessons/3a20b9d7-4b24-45bd-9dc1-b52731237f8e/feedback with the payload:
      """
      {
          "student_id": "1a916d78-ed1f-4afb-9da9-7d927a7eeb51",
          "value": 2,
          "comment": "I don't like too much how the teacher explain things."
      }
      """
    Then I get a 200 response
    And the feedback has been created
    And the feedback is included in the response
    And the feedback to_id is now "3a20b9d7-4b24-45bd-9dc1-b52731237f8e"

  Scenario: Listing feedback
    Given there is a feedback with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a feedback with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /feedback/
    Then I get a 200 response
    And there are 2 feedback in the response

  Scenario: Listing feedback by teacher
    Given there is a feedback with ID '44d30604-93a0-4ded-ae8b-2a8dd736eadd'
    And there is a 'teacher' with ID 'bf4288f7-bbe2-4297-a166-3026be601475'
    And there is a feedback with ID '2f34e1f3-94d3-47c7-a2bc-4ad54a832f97'
    When I request GET /teachers/bf4288f7-bbe2-4297-a166-3026be601475/feedback/
    Then I get a 200 response
    And there are 1 feedback in the response

  Scenario: Listing feedback by teacher
    And there is a 'teacher' with ID 'bf4288f7-bbe2-4297-a166-3026be601475'
    And there is a feedback with ID '2f34e1f3-94d3-47c7-a2bc-4ad54a832f97'
    And there is a feedback with ID '90709b5b-14ba-4c30-b764-67e56ac89bbe'
    And the feedback was already viewed
    When I request GET /teachers/bf4288f7-bbe2-4297-a166-3026be601475/feedback?unread=true
    Then I get a 200 response
    And there are 1 feedback in the response

  Scenario: Listing feedback by teacher
    And there is a 'teacher' with ID 'bf4288f7-bbe2-4297-a166-3026be601475'
    And there is a feedback with ID '2f34e1f3-94d3-47c7-a2bc-4ad54a832f97'
    And there is a feedback with ID '90709b5b-14ba-4c30-b764-67e56ac89bbe'
    And the feedback was already viewed
    When I request GET /teachers/bf4288f7-bbe2-4297-a166-3026be601475/feedback
    Then I get a 200 response
    And there are 2 feedback in the response

  Scenario: Listing feedback by manager
    Given there is a feedback with ID '44d30604-93a0-4ded-ae8b-2a8dd736eadd'
    And there is a 'preceptor' with ID 'bf4288f7-bbe2-4297-a166-3026be601475'
    And there is a feedback with ID '2f34e1f3-94d3-47c7-a2bc-4ad54a832f97'
    When I request GET /preceptors/bf4288f7-bbe2-4297-a166-3026be601475/feedback/
    Then I get a 200 response
    And there are 1 feedback in the response

  Scenario: Listing feedback by lesson
    Given there is a feedback with ID '44d30604-93a0-4ded-ae8b-2a8dd736eadd'
    And there is a 'lesson' with ID 'bf4288f7-bbe2-4297-a166-3026be601475'
    And there is a feedback with ID '2f34e1f3-94d3-47c7-a2bc-4ad54a832f97'
    When I request GET /lessons/bf4288f7-bbe2-4297-a166-3026be601475/feedback/
    Then I get a 200 response
    And there are 1 feedback in the response

  Scenario: Viewing single feedback
    Given there is a feedback with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request GET /feedback/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the feedback is included in the response

  Scenario: Updating feedback
    Given there is a feedback with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /feedback/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "value": 4
      }
      """
    Then I get a 200 response
    And the feedback is included in the response
    And the feedback value is now 4

  Scenario: Updating feedback invalid value
    Given there is a feedback with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /feedback/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "value": 6
      }
      """
    Then I get a 422 response

  Scenario: Updating feedback invalid value
    Given there is a feedback with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /feedback/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "value": 0
      }
      """
    Then I get a 422 response

  Scenario: Updating an feedback that not exists
    And there is a feedback with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /feedback/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "value": 4
      }
      """
    Then I get a 404 response

  Scenario: Deleting feedback
    Given there is a feedback with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /feedback/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the feedback was removed
