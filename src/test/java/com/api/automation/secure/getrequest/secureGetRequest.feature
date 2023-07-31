@tag
Feature: To access the GET endpoint which is secure with Basic Auth
  GET /secure/webapi/all
  
  Background: Setup the base path
  	Given url 'http://localhost:9897'

  @tag1
  Scenario: To access the GET endpoint with basic auth
  	Given path '/secure/webapi/all'
  	And headers {Accept:'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
  	When method get
  	Then status 200
  	And match response == '#notnull'
  	
  @tag1
  Scenario: To verify the GET endpoint without basic auth
  	Given path '/secure/webapi/all'
  	And headers {Accept:'application/json'}
  	When method get
  	Then status 401
  	And match response == '#notnull'
  	
  @tag1
  Scenario: To verify the GET endpoint with and incorrect token
  	Given path '/secure/webapi/all'
  	And headers {Accept:'application/json', Authorization: 'Basic YWRtaW58d2VsY29tZQ=='}
  	When method get
  	Then status 401
  	And match response == '#notnull'
  	
  @tag1
  Scenario: To access the GET endpoint with basic auth using js function
  	Given path '/secure/webapi/all'
  	* def authMethod = call read('../../basicAuth.js') {username:'admin', password:'welcome'}
  	When print "Encoded string -> ", authMethod
  	And headers {Accept:'application/json', Authorization: '#(authMethod)'}
  	When method get
  	Then status 200
  	And match response == '#notnull'
