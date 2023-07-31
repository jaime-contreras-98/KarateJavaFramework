Feature: To validate the GET Endpoint
  To validate the get endpoint reponse

  Background: Setup the base url
    Given url 'http://localhost:9897'

   Scenario: To contain the data in json format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[1] == 'SQL Lite'
    #And match response.[0].experience == '#[3]' # size of array
    #And match response.[0].project[0].technology == '#[3]' # size of array
    And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"] # in any position of array
    And match response.[0].experience[*] contains ["Google"] # contains any of position on array
    And match response.[*].jobId contains 1
    