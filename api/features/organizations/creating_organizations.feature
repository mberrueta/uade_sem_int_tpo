@organization
Feature: Creating organizations
  In order to create an shcool
  As a user I should be able to create new organizations

  Scenario: As a Admin
    When I request POST /organizations with the payload:
      """
      {
          "name": "New org"
      }
      """
    Then I get a 200 response
    And the organization has been created

  Scenario:  As a Admin with invalid name
    When I request POST /organizations with the payload:
      """
      {
      }
      """
    Then I get a 422 response
