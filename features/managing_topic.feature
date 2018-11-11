@topic
Feature: Managing topics
  In order to manage a school topic
  As a user member of an organization
  I should be able to create, edit, view or delete the topics from my organization

  Scenario: Creating an topic with minimum required attributes
    Given there is a lesson with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST lessons/dc1750e0-968d-44dc-b131-4fd3fc3f7233/topics with the payload:
      """
      {
          "title": "something"
      }
      """
    Then I get a 200 response
    And the topic has been created
    And the topic is included in the response

  Scenario: Listing topics
    Given there is a topic with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a topic with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /topics/
    Then I get a 200 response
    And there are 2 topics in the response

  Scenario: Viewing single topic
    Given there is a topic with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request GET /topics/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the topic is included in the response

  Scenario: Updating topic
    Given there is a topic with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /topics/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "title": "something"
      }
      """
    Then I get a 200 response
    And the topic is included in the response
    And the topic title is now "something"

  Scenario: Updating an topic that not exists
    And there is a topic with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /topics/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "title": "something"
      }
      """
    Then I get a 404 response

  Scenario: Deleting topics
    Given there is a topic with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /topics/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the topic was removed
