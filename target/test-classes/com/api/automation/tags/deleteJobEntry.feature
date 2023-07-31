@smoke
Feature: To test and patch endpoint for updating the job description
	DELETE /normal/webapi/remove/{id}
	
	Background: Create and initialize base url
		Given url 'http://localhost:9897'

  Scenario: To delete the job entry from application using jobId
  	# CREATE
  	* def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)'}
  	
  	# DELETE
  	Given path '/normal/webapi/remove/' + jobId
  	And headers {Accept:'application/json'}
  	When method delete
  	And status 200
  	Then print response
  	
  	# GET
  	Given path '/normal/webapi/find'
  	And params {id:'#(jobId)', jobTitle: 'Software Engg REUSABLE'}
  	And header Accept = 'application/json'
  	When method get
  	Then status 404
  	And print response
  	
  Scenario: To delete the job entry from application using jobId and delete the job entry twice
  	# CREATE
  	* def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)'}
  	
  	# DELETE
  	Given path '/normal/webapi/remove/' + jobId
  	And headers {Accept:'application/json'}
  	When method delete
  	And status 200
  	Then print response
  	
  	# GET
  	Given path '/normal/webapi/remove/' + jobId
  	And headers {Accept:'application/json'}
  	When method delete
  	And status 404
  	Then print response
  	
  Scenario: To demo request chaining
  	# create job entry, extract jobid and jobTitle, send path request with extracted info
  	# CREATE
  	* def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)'}
  	* def respJobId = createJob.responseJobId
  	* def respJobTitle = createJob.responseJobTitle
  	
  	# PATH 
  	* def jobDescr = 'To develop modern android apps!!!!!!!'
  	Given path '/normal/webapi/update/details'
  	And params {id: '#(respJobId)', jobTitle: '#(respJobTitle)', jobDescription: '#(jobDescr)'}
  	And header Accept = 'application/json'
  	And request {}
  	When method patch
  	And status 200
  	* def jobId = response.jobId
  	* def jobTitle = response.jobTitle
  	Then print response
  	
  	# GET
  	Given path '/normal/webapi/find'
  	And params {id: '#(respJobId)', jobTitle: '#(respJobTitle)', jobDescription: '#(jobDescr)'}
  	And header Accept = 'application/json'
  	When method get
  	Then status 200
  	And print response
  	And match response.jobDescription == jobDescr
  	
  	
  	