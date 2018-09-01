@organization
Feature: Viewing organizations
  In order to get information about the organizations
  As a user member of organizations
  I should be able to view a list of all my organizations

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
