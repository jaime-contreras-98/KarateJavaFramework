Feature: Create a job entry in the application external files
	Use POST /normal/webapi/add to create job entry in the application
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9897'

  Scenario: create a job entry in json format external file
  	Given path '/normal/webapi/add'
  	* def body = read("dataPackage/jobEntry.json")
  	And request body 
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status 201
  	Then match response.jobId == 4
  	And print response

  Scenario: create a job entry in xml format - Accept: Respuesta en tipo de formato - Content-Type: Contenido del body tipo de formato external file
  	Given path '/normal/webapi/add'
  	* def body = read("dataPackage/jobEntry.xml")
  	And request body
    And headers {Accept: 'application/json', Content-Type: 'application/xml'}	
  	When method post
  	And status 201
  	Then match response.jobTitle == "Software Engg 5"
  	And print response

  Scenario: create a job entry in xml format including response in xml - Accept: Respuesta en tipo de formato - Content-Type: Contenido del body tipo de formato
  	Given path '/normal/webapi/add'
  	* def body = read("dataPackage/jobEntry.xml")
  	And request body
    And headers {Accept: 'application/xml', Content-Type: 'application/xml'}	
  	When method post
  	And status 201
  	Then match response/Job/jobId == "7"
  	And print response