@academic_calendar
Feature: Managing academic calendars
  In order to manage a school year
  As a user member of an organization
  I should be able to create, edit, view or delete the academic calendars from my organization

  Scenario: Creating an academic calendar with minimum required attributes
    Given there is an organization with ID 3
    When I request POST organizations/3/academic-calendars with the payload:
      """
      {
          "year": 2019
      }
      """
    Then I get a 200 response
    And the academic calendar has been created
    And the academic calendar is included in the response

  Scenario: Listing academic calendars
    Given there is an academic calendar with ID 10
    And there is an academic calendar with ID 12
    When I request GET /academic-calendars/
    Then I get a 200 response
    And there are 2 academic calendars in the response

  Scenario: Viewing single academic calendar
    Given there is an academic calendar with ID 13
    When I request GET /academic-calendars/13
    Then I get a 200 response
    And the academic calendar is included in the response
    And there is an academic calendar with ID 10

  Scenario: Updating academic calendar
    Given there is an academic calendar with ID 10
    When I request PUT /academic-calendars/10 with the payload:
      """
      {
        "year": 2023
      }
      """
    Then I get a 200 response
    And the academic calendar is included in the response
    And the academic calendar year is now 2023

  Scenario: Updating an academic calendar that not exists
    And there is an academic calendar with ID 12
    When I request PUT /academic-calendars/14 with the payload:
      """
      {
        "year": 1212
      }
      """
    Then I get a 404 response

  Scenario: Deleting academic_calendars
    Given there is an academic calendar with ID 13
    When I request DELETE /academic-calendars/13
    Then I get a 204 response
    And the academic calendar was removed
