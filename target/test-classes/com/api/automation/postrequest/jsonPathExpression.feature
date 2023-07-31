Feature: To use the JSON path expression

  Background: Create and initialize base URL
		Given url 'http://localhost:9897'

  Scenario: To get the value of property using json path expression
		Given path '/normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		* def jobId = 1
		* def jobTitle = karate.jsonPath(response, "$[?(@.jobId == " + jobId + ")].jobTitle")
		* def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription")
		* def jobExperience = karate.jsonPath(response, "$[?(@.jobId == 1)].experience")
		And print "Title: ", jobTitle
		And print "Description: ", jobDescription
		And print "Experience: ", jobExperience	
		