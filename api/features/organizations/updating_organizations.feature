@organization
Feature: Updating organizations
  In order to change the details of an organization

  Scenario: As an Admin
    And there is an organization with ID 10
    When I request PUT /organizations/10 with the payload:
      """
      {
        "name": "New name"
      }
      """
    Then I get a 200 response
    And the organization is included in the response
    And the organization name is now "New name"

  Scenario: Invalid empty organization name
    And there is an organization with ID 12
    When I request PUT /organizations/12 with the payload:
      """
      {
        "name": null
      }
      """
    Then I get a 422 response

  Scenario: Invalid empty organization name
    And there is an organization with ID 12
    When I request PUT /organizations/14 with the payload:
      """
      {
        "name": null
      }
      """
    Then I get a 404 response
