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
    Given there is an organization with ID '258856cd-29f0-4ab3-a993-2c532bb108ae'
    And there is an organization with ID '34478221-b210-4b2c-8ed3-704fa1c1dc71'
    When I request GET /organizations/
    Then I get a 200 response
    And there are 2 organizations in the response

  Scenario: Viewing single organization
    Given there is an organization with ID '2ac62613-2f5f-49c6-bc93-7e6af693672e'
    When I request GET /organizations/2ac62613-2f5f-49c6-bc93-7e6af693672e
    Then I get a 200 response
    And the organization is included in the response

  Scenario: Updating an organization
    And there is an organization with ID '52b1694b-81a0-4ce0-b223-186a85082ec7'
    When I request PUT /organizations/52b1694b-81a0-4ce0-b223-186a85082ec7 with the payload:
      """
      {
        "name": "New name"
      }
      """
    Then I get a 200 response
    And the organization is included in the response
    And the organization name is now "New name"

  Scenario: Updating organization with invalid organization name
    And there is an organization with ID '64f5fcd5-da8b-4e28-b1cf-909cfa6a088a'
    When I request PUT /organizations/64f5fcd5-da8b-4e28-b1cf-909cfa6a088a with the payload:
      """
      {
        "name": null
      }
      """
    Then I get a 422 response

  Scenario: Updating an organization that not exists
    And there is an organization with ID '94208742-b1aa-4367-b6ec-8e7f30980239'
    When I request PUT /organizations/832f2eba-434f-4517-90f2-dc526e71c713 with the payload:
      """
      {
        "name": null
      }
      """
    Then I get a 404 response

  Scenario: Deleting organizations
    Given there is an organization with ID '7cf58868-adaa-4ebe-b205-a274eec58535'
    When I request DELETE /organizations/7cf58868-adaa-4ebe-b205-a274eec58535
    Then I get a 204 response
    And the organization was removed
