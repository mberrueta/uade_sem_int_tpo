@academic_calendar
Feature: Managing academic calendars
  In order to manage a school year
  As a user member of an organization
  I should be able to create, edit, view or delete the academic calendars from my organization

  Scenario: Creating an academic calendar with minimum required attributes
    Given there is an organization with ID '37240fba-fcd7-4711-a905-eb12df322110'
    When I request POST organizations/37240fba-fcd7-4711-a905-eb12df322110/academic-calendars with the payload:
      """
      {
          "year": 2019
      }
      """
    Then I get a 200 response
    And the academic calendar has been created
    And the academic calendar is included in the response

  Scenario: Listing academic calendars
    Given there is an academic calendar with ID '4af26246-1f45-4a94-b481-fab7fd0b6b99'
    And there is an academic calendar with ID '373d74ff-c864-4b9b-b427-31b66b8ca87b'
    When I request GET /academic-calendars/
    Then I get a 200 response
    And there are 2 academic calendars in the response

  Scenario: Viewing single academic calendar
    Given there is an academic calendar with ID '81a28ba0-70d7-4d0e-b1cd-8922a465a335'
    When I request GET /academic-calendars/81a28ba0-70d7-4d0e-b1cd-8922a465a335
    Then I get a 200 response
    And the academic calendar is included in the response

  Scenario: Updating academic calendar
    Given there is an academic calendar with ID '9bd37ba3-c6d9-40f5-9258-84966a1a7508'
    When I request PUT /academic-calendars/9bd37ba3-c6d9-40f5-9258-84966a1a7508 with the payload:
      """
      {
        "year": 2023
      }
      """
    Then I get a 200 response
    And the academic calendar is included in the response
    And the academic calendar year is now 2023

  Scenario: Updating an academic calendar that not exists
    And there is an academic calendar with ID '8ff2626b-56b2-445d-97c2-9e7e8b49c328'
    When I request PUT /academic-calendars/6bf0b5b9-a555-42ad-81a9-fb22168753d2 with the payload:
      """
      {
        "year": 1212
      }
      """
    Then I get a 404 response

  Scenario: Deleting academic_calendars
    Given there is an academic calendar with ID 'd5de2a78-6c83-4dc9-a2d7-053405e98064'
    When I request DELETE /academic-calendars/d5de2a78-6c83-4dc9-a2d7-053405e98064
    Then I get a 204 response
    And the academic calendar was removed
