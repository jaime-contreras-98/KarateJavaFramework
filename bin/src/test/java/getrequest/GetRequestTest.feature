Feature: This is a test feature file
  Just for testing purposes

  Scenario: To test the get and endpoint with JSON data
    Given the application url 'www.google.com'
    And the context path is '/getdata'
    When I send the get request
    Then status code should be 200
    And the response format should be in JSON

  Scenario: To test the get and endpoint with xml data
    Given the application url 'www.google.com'
    And the context path is '/getdata'
    When I send the get request
    Then status code should be 200
    And the response format should be in JSON