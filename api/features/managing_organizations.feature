@organization
Feature: Managing organizations
  In order to manage a College, School or institution
  As a user member of organizations
  I should be able to create, edit, view or delete the organizations that I belong

  Scenario: Creating an organization with minimum required attributes
    When I request POST /organizations with the payload:
      """
      {
          "name": "New org",
          "phone": "123-4566676",
          "address": "Av. siempre viva 32, springfield"
      }
      """
    Then I get a 200 response
    And the organization has been created
    And the organization is included in the response

  Scenario: Creating an organization without name
    When I request POST /organizations
    Then I get a 422 response
    And the response error is like "Name can't be blank"

  Scenario: Creating an organization with invalid type
    When I request POST /organizations with the payload:
      """
      {
          "organization_type ": "not_exists"
      }
      """
    Then I get a 422 response
    And the response error is like "Name can't be blank"

  Scenario: Listing organizations
    Given there is an organization with ID 10
    And there is an organization with ID 12
    When I request GET /organizations/
    Then I get a 200 response
    And there are 2 organizations in the response

  Scenario: Viewing single organization
    Given there is an organization with ID 13
    When I request GET /organizations/13
    Then I get a 200 response
    And the organization is included in the response
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

  Scenario: Updating organization with invalid organization name
    And there is an organization with ID 12
    When I request PUT /organizations/12 with the payload:
      """
      {
        "name": null
      }
      """
    Then I get a 422 response

  Scenario: Updating an organization that not exists
    And there is an organization with ID 12
    When I request PUT /organizations/14 with the payload:
      """
      {
        "name": null
      }
      """
    Then I get a 404 response

  Scenario: Deleting organizations
    Given there is an organization with ID 13
    When I request DELETE /organizations/13
    Then I get a 204 response
    And the organization was removed
