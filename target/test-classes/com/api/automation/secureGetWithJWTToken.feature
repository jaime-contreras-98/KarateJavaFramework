@tag
Feature: To send the get request with JWT Token
	GET https://jobapplicationjwt.herokuapp.com/auth/webapi/all

  @tag1
  Scenario: Send the GET request with JWT token
  	* def token = call read('../../getToken.feature') {username: 'John Wick', password: 'Guns and Bikes'}
  	Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
		And headers {Accept: 'application/json', Authentication: '#("Bearer " + token.authToken)'}
		When method get
		Then status 200
		
	@tag1
  Scenario: Send the GET request without JWT token
  	Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
		And headers {Accept: 'application/json'}
		When method get
		Then status 200