Feature: This is a test feature file
  Just for testing purposes

  Scenario: To get all the data from application in JSON format
    Given url 'http://localhost:9897/normal/webappi/all'
    When method get # specify http method
    Then status 200 # assert status code
