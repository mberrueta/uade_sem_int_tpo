@parent
Feature: Managing parents
  In order to manage a school parent
  As a user member of an organization
  I should be able to create, edit, view or delete the parents of a student

  Scenario: Creating a 'parent' with minimum required attributes
    Given there is a 'student' with ID '98be7273-d048-4a0f-8ff8-e48be23da253'
    When I request POST /students/98be7273-d048-4a0f-8ff8-e48be23da253/parents with the payload:
      """
      {
          "first_name": "pp",
          "last_name": "argento",
          "phone": "123-45677",
          "email": "pp.argento@gmail.com",
          "address": "Somewhere 123, BsAs",
          "gender": "male"
      }
      """
    Then I get a 200 response
    And the 'parent' has been created
    And the 'parent' is included in the response

  Scenario: Listing parents
    Given there is a 'parent' with ID '2bd474fc-07a4-4af3-a5a8-8befec1bda9e'
    And there is a 'parent' with ID '3e5ffc31-c46c-4028-ad0f-d5a0e98c1e56'
    When I request GET /parents/
    Then I get a 200 response
    And there are 2 'parents' in the response

  Scenario: Viewing single parent
    Given there is a 'parent' with ID 'ccc54dc3-32a3-49e7-85e9-929038387529'
    When I request GET /parents/ccc54dc3-32a3-49e7-85e9-929038387529
    Then I get a 200 response
    And the 'parent' is included in the response

  Scenario: Updating parent
    Given there is a 'parent' with ID 'be161390-e18e-4d39-ab59-a9e8c2aea0c7'
    When I request PUT /parents/be161390-e18e-4d39-ab59-a9e8c2aea0c7 with the payload:
      """
      {
        "first_name": "pp"
      }
      """
    Then I get a 200 response
    And the 'parent' is included in the response
    And the 'parent' first name is now "pp"

  Scenario: Updating a 'parent' that not exists
    And there is a 'parent' with ID '69d4b55f-436a-4b1a-8c7e-76d374576494'
    When I request PUT /parents/198de18b-28aa-4947-b7c4-c2081d69f608 with the payload:
      """
      {
        "first_name": "pp"
      }
      """
    Then I get a 404 response

  Scenario: Deleting parents
    Given there is a 'parent' with ID 'ae19214b-0642-4c5c-801e-2efe21dfa9a3'
    When I request DELETE /parents/ae19214b-0642-4c5c-801e-2efe21dfa9a3
    Then I get a 204 response
    And the 'parent' was removed

