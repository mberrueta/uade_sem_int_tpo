@preceptor
Feature: Managing preceptors
  In order to manage a school preceptor
  As a user member of an organization
  I should be able to create, edit, view or delete the preceptors from my organization

  Scenario: Creating a preceptor with minimum required attributes
    Given there is an organization with ID '98be7273-d048-4a0f-8ff8-e48be23da253'
    When I request POST organizations/98be7273-d048-4a0f-8ff8-e48be23da253/preceptors with the payload:
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
    And the 'preceptor' has been created
    And the 'preceptor' is included in the response

  Scenario: Listing preceptors
    Given there is a 'preceptor' with ID '2bd474fc-07a4-4af3-a5a8-8befec1bda9e'
    And there is a 'preceptor' with ID '3e5ffc31-c46c-4028-ad0f-d5a0e98c1e56'
    When I request GET /preceptors/
    Then I get a 200 response
    And there are 2 'preceptors' in the response

  Scenario: Viewing single preceptor
    Given there is a 'preceptor' with ID 'ccc54dc3-32a3-49e7-85e9-929038387529'
    And there is a course with ID "a652a7f8-d519-4696-96a2-b7f084c3e106"
    And the course have 20 students
    And the course have 10 subjects
    When I request GET /preceptors/ccc54dc3-32a3-49e7-85e9-929038387529
    Then I get a 200 response
    And the 'preceptor' is included in the response
    And the preceptor courses are included in the response
    And the preceptor first course response students count is 20
    And the preceptor first course response subjects count is 10

  Scenario: Updating preceptor
    Given there is a 'preceptor' with ID 'be161390-e18e-4d39-ab59-a9e8c2aea0c7'
    When I request PUT /preceptors/be161390-e18e-4d39-ab59-a9e8c2aea0c7 with the payload:
      """
      {
        "first_name": "pp"
      }
      """
    Then I get a 200 response
    And the 'preceptor' is included in the response
    And the 'preceptor' first name is now "pp"

  Scenario: Updating a preceptor that not exists
    And there is a 'preceptor' with ID '69d4b55f-436a-4b1a-8c7e-76d374576494'
    When I request PUT /preceptors/198de18b-28aa-4947-b7c4-c2081d69f608 with the payload:
      """
      {
        "first_name": "pp"
      }
      """
    Then I get a 404 response

  Scenario: Deleting preceptors
    Given there is a 'preceptor' with ID 'ae19214b-0642-4c5c-801e-2efe21dfa9a3'
    When I request DELETE /preceptors/ae19214b-0642-4c5c-801e-2efe21dfa9a3
    Then I get a 204 response
    And the 'preceptor' was removed

