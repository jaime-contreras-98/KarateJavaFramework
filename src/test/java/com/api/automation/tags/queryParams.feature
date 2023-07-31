Feature: To test and get endpoint with query parameter
  
  Background: Setup the base path
    Given url 'http://localhost:9897'
    
  Scenario: To get the data using Query Parameter
  	# post from reusable feature files
  	* def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature"){ _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)' }
  	
  	# get with query parameter
  	Given path '/normal/webapi/find'
  	#And param id = jobId
  	#And param jobTitle = 'Software Engg 4 MODIFIED'
  	And params {id : '#(jobId)', jobTitle : 'Software Engg 4 MODIFIED'}
  	And headers {Accept: 'application/json'}
  	When method get
  	Then status 200
  	And match response.jobId == jobId
  	
  Scenario: To get the data using Query Parameter with jobId not in the app
  	# post from reusable feature files
  	* def getRandomValue = function() { return Math.floor((100) * Math.random()); }
  	* def jobId = getRandomValue()
  	* def createJob = call read("../createJobEntryWithVariablesReusablee.feature"){ _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(jobId)' }
  	
  	# get with query parameter
  	Given path '/normal/webapi/find'
  	And param id = 1234564
  	And param jobTitle = 'Software Engg 4 MODIFIED'
  	And headers {Accept: 'application/json'}
  	When method get
  	Then status 404
  	#And match response.jobId == jobId
  	
  	
	