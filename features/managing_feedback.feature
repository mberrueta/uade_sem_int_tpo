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
          "value": 1,
          "comment": "I hate the preceptor."
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
          "value": 4,
          "comment": "I like the lesson."
      }
      """
    Then I get a 200 response
    And the feedback has been created
    And the feedback is included in the response
    And the feedback to_id is now "3a20b9d7-4b24-45bd-9dc1-b52731237f8e"

  Scenario: Creating an feedback with minimum required attributes to a exam
    Given there is a 'exam' with ID '38f05739-2433-43b9-8255-29a86f852a38'
    Given there is a 'student' with ID '8cf0fc05-9fab-4e97-b553-efd23cde8ad2'
    When I request POST /exams/38f05739-2433-43b9-8255-29a86f852a38/feedback with the payload:
      """
      {
          "student_id": "8cf0fc05-9fab-4e97-b553-efd23cde8ad2",
          "value": 5,
          "comment": "Love it."
      }
      """
    Then I get a 200 response
    And the feedback has been created
    And the feedback is included in the response
    And the feedback to_id is now "38f05739-2433-43b9-8255-29a86f852a38"

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

  Scenario: Listing feedback by lesson and student
    Given there is a feedback with ID 'e43df1aa-bf88-4aff-9932-0aa81e4a0838'
    And there is a 'lesson' with ID '89ab1d55-a4c6-47e9-8678-e0da23c24c15'
    And there is a feedback with ID '09e6333a-bd0e-46f2-836b-c250719d9625'
    And there is a 'student' with ID 'bbbf2b54-be5b-444e-b882-12d572840796'
    And there is a feedback with ID '056c7ccf-4e3d-4373-aa7c-3ad1265aed8f'
    And there is a feedback with ID '80eb3308-0acb-4e60-ac01-4b8c871a1b0d'
    When I request GET /lessons/89ab1d55-a4c6-47e9-8678-e0da23c24c15/feedback?student_id=bbbf2b54-be5b-444e-b882-12d572840796
    Then I get a 200 response
    And there are 2 feedback in the response

  Scenario: Listing feedback to teacher grouped by lesson
    Given there is a feedback with ID '84203c2c-e91f-46e2-a9c2-ac4a7c9e6e4c'
    And there is a 'lesson' with ID '89ab1d55-a4c6-47e9-8678-e0da23c24c15'
    And there is a 'teacher' with ID '80449209-ee0c-40a4-9342-3b58ee505df9'
    And there is a feedback with ID '0327421e-e9e0-479f-bbbe-66f79872f61a' with grouped lesson ID '89ab1d55-a4c6-47e9-8678-e0da23c24c15'
    And there is a 'student' with ID 'd4439948-505e-49fd-be9b-a942935fab9f'
    And there is a feedback with ID 'e4f482d9-2104-4ada-833f-efba53421f6d' with grouped lesson ID '89ab1d55-a4c6-47e9-8678-e0da23c24c15'
    And there is a 'student' with ID '9afbc38c-e842-4279-8a61-677004800e10'
    And there is a feedback with ID '30fe7265-949d-47db-b0c7-3513b1f9aa7c' with grouped lesson ID '89ab1d55-a4c6-47e9-8678-e0da23c24c15'
    And there is a 'lesson' with ID '0f460018-67cd-411c-bac8-df87850ac57c'
    And there is a feedback with ID '76689317-7b11-4490-b524-7c805dc38445' with grouped lesson ID '0f460018-67cd-411c-bac8-df87850ac57c'
    When I request GET /teachers/80449209-ee0c-40a4-9342-3b58ee505df9/feedback?grouped_lesson_id=89ab1d55-a4c6-47e9-8678-e0da23c24c15
    Then I get a 200 response
    And there are 3 feedback in the response

  Scenario: Listing feedback by exam
    Given there is a feedback with ID '9a2a224c-4975-40f9-a631-1a08e2bf4d87'
    And there is a 'exam' with ID '9a13db95-3519-4641-b9d8-94437dc42d7a'
    And there is a feedback with ID '6fd87602-8a9b-46ec-a435-446b470e2d82'
    When I request GET /exams/9a13db95-3519-4641-b9d8-94437dc42d7a/feedback/
    Then I get a 200 response
    And there are 1 feedback in the response

  Scenario: Listing feedback by exam and student
    Given there is a feedback with ID '6f323cb0-a656-4bf7-95d8-f98266d4a3be'
    And there is a 'exam' with ID '3270d0c6-d969-4ce6-978a-e7d808149d65'
    And there is a feedback with ID 'e7e5f83b-d4a6-4443-b337-f829cae0ec43'
    And there is a 'student' with ID '5160e876-b921-4284-97d4-f4ded7c53f35'
    And there is a feedback with ID '16113180-844e-40d7-b3ae-e0796e25a492'
    And there is a feedback with ID 'cdd67c13-6a70-40e3-8897-729dea831225'
    When I request GET /exams/3270d0c6-d969-4ce6-978a-e7d808149d65/feedback?student_id=5160e876-b921-4284-97d4-f4ded7c53f35
    Then I get a 200 response
    And there are 2 feedback in the response

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
