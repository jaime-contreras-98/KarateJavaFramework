Feature: This is a test feature file
  Just for testing purposes

  Background: Setup the base path
    Given url _url
    And print '=========== tHIS IS A BACKGROUND KEYWORD ==========='

  Scenario: To get all the data from application in JSON format
    # Given url 'http://localhost:9897/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method get # specify http method
    Then status 201 # assert status code

  Scenario: To get all the data from application in JSON format using path variable
    Given path '/normal/webapi/all'
    When method get # specify http method
    Then status 201 # assert status code

  Scenario: To get all the data from application in JSON format using path variable sending json header
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get # specify http method
    Then status 201 # assert status code

  Scenario: To get all the data from application in JSON format using path variable sending xml header
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get # specify http method
    Then status 201 # assert status code
