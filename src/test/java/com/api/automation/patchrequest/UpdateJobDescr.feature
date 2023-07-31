Feature: To test and patch endpoint for updating the job description
	PATCH /normal/webapi/update/details
	
	Background: Create and initialize base url
		Given url 'http://localhost:9897'
		
	Scenario: To update the job description for newly added job entry
	  * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)'}
  	* def jobDescr = 'To develop new android apps!'
  	Given path '/normal/webapi/update/details'
  	And params {id: '#(jobId)', jobTitle:'Software Engg REUSABLE', jobDescription: '#(jobDescr)' }
  	And header Accept = 'application/json'
  	And request {}
  	When method patch
  	Then status 200
  	And print response
  	And match response.jobDescription == jobDescr
  	
  Scenario: To update the job description for newly added job entry using a fake idNumber
	  * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)'}
  	* def jobDescr = 'To develop new android apps!'
  	Given path '/normal/webapi/update/details'
  	And params {id: 400, jobTitle:'Software Engg REUSABLE', jobDescription: '#(jobDescr)' }
  	And header Accept = 'application/json'
  	And request {}
  	When method patch
  	Then status 404
  	And print response
  	#And match response.jobDescription != jobDescr
  	
  Scenario: To update the job description for newly added job entry without jobTitle
	  * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)'}
  	* def jobDescr = 'To develop new android apps!'
  	Given path '/normal/webapi/update/details'
  	And params {id: '#(jobId)', jobDescription: '#(jobDescr)' }
  	And header Accept = 'application/json'
  	And request {}
  	When method patch
  	Then status 400
  	And match response.message == "Required String parameter 'jobTitle' is not present"
  	