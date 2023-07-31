Feature: To validate the GET Endpoint
  To validate the get endpoint reponse

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the data in JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
		# create a variable that stores the data from external file
		* def actualResponse = read("../jsonResponse.json")
		And match response == actualResponse
		And print actualResponse
		
	Scenario: To get the data in XML format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
		# create a variable that stores the data from external file
		* def actualResponse = read("../xmlResponse.xml")
		And match response == actualResponse
		And print actualResponse