@program
Feature: Managing programs
  In order to manage a school program
  As a user member of an organization
  I should be able to create, edit, view or delete the programs from my organization

  Scenario: Creating an program with minimum required attributes
    Given there is a subject with ID 'dc1750e0-968d-44dc-b131-4fd3fc3f7233'
    When I request POST subjects/dc1750e0-968d-44dc-b131-4fd3fc3f7233/programs with the payload:
      """
      {
          "day": "20191001",
          "class_number": 2
      }
      """
    Then I get a 200 response
    And the program has been created
    And the program is included in the response

  Scenario: Listing programs
    Given there is a program with ID 'f884094d-0bf1-4ce7-aeeb-df0f0103ecc4'
    And there is a program with ID 'fbab54c2-90c5-4914-a885-d38a6b826efe'
    When I request GET /programs/
    Then I get a 200 response
    And there are 2 programs in the response

  Scenario: Viewing single program
    Given there is a program with ID '76ff8ffc-e643-443d-aa87-9ec344317f65'
    When I request GET /programs/76ff8ffc-e643-443d-aa87-9ec344317f65
    Then I get a 200 response
    And the program is included in the response

  Scenario: Updating program
    Given there is a program with ID 'c27c9832-bad7-4c74-ae81-5a20789e0637'
    When I request PUT /programs/c27c9832-bad7-4c74-ae81-5a20789e0637 with the payload:
      """
      {
        "day": "2019-10-01"
      }
      """
    Then I get a 200 response
    And the program is included in the response
    And the program day is now "2019-10-01"

  Scenario: Updating an program that not exists
    And there is a program with ID 'a75a227b-bdc4-40ab-ae4c-482c81b4aa8a'
    When I request PUT /programs/69b4d255-60df-4343-9672-35506c8093c2 with the payload:
      """
      {
        "day": "20191001"
      }
      """
    Then I get a 404 response

  Scenario: Deleting programs
    Given there is a program with ID 'fd96c08e-5087-4e4c-87a6-6d4a62771252'
    When I request DELETE /programs/fd96c08e-5087-4e4c-87a6-6d4a62771252
    Then I get a 204 response
    And the program was removed
