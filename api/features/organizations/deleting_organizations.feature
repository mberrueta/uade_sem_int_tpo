@organization
Feature: Deleting organization
  In order to remove an organization
  As a application user I should be able to delete
  an organization that I belong

  Scenario: Listing organizations
    Given there is an organization with ID 13
    When I request DELETE /organizations/13
    Then I get a 204 response
    And the organization was removed
