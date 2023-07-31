Feature: Create a job entry in the application
	Use POST /normal/webapi/add to create job entry in the application
	
	Background: Create and initialize base URL
		Given url 'http://localhost:9897'

  Scenario: create a job entry in json format
  	Given path '/normal/webapi/add'
  	And request  { "jobId":4, "jobTitle":"Software Engg 4", "jobDescription":"To develop andriod applications!!!!", "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status 201
  	Then match response.jobId == 4
  	And print response

  Scenario: create a job entry in xml format - Accept: Respuesta en tipo de formato - Content-Type: Contenido del body tipo de formato
  	Given path '/normal/webapi/add'
  	And request <item> <jobId>3</jobId> <jobTitle>Software Engg 5</jobTitle> <jobDescription>To develop andriod applications testing xml!!</jobDescription> <experience> <experience>Google</experience> <experience>Playstation</experience> </experience> <project> <project> <projectName>Movie Applications</projectName> <technology> <technology>Docker</technology> </technology> </project> </project> </item>
    And headers {Accept: 'application/json', Content-Type: 'application/xml'}	
  	When method post
  	And status 201
  	Then match response.jobTitle == "Software Engg 5"
  	And print response

  Scenario: create a job entry in xml format including response in xml - Accept: Respuesta en tipo de formato - Content-Type: Contenido del body tipo de formato
  	Given path '/normal/webapi/add'
  	And request <item> <jobId>3</jobId> <jobTitle>Software Engg 7</jobTitle> <jobDescription>To develop andriod applications testing xml!!</jobDescription> <experience> <experience>Google</experience> <experience>Playstation</experience> </experience> <project> <project> <projectName>Movie Applications</projectName> <technology> <technology>Docker</technology> </technology> </project> </project> </item>
    And headers {Accept: 'application/xml', Content-Type: 'application/xml'}	
  	When method post
  	And status 201
  	Then match response/Job/jobId == "7"
  	And print response
  	
  Scenario: create a job entry in json format using embedded expression
  	Given path '/normal/webapi/add'
  	* def getJobId = function() {return Math.floor((100) * Math.random());}
  	And request  { "jobId": '#(getJobId())', "jobTitle":"Software Engg 4", "jobDescription":"To develop andriod applications!!!!", "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status 201
  	#Then match response.jobId == getJobId
  	And print response
  	
  Scenario: create a job entry in xml format including response in xml using embedded expression
  	Given path '/normal/webapi/add'
  	* def getJobId = function() {return Math.floor((100) * Math.random());}
  	* def jobId = getJobId()
  	And request <item> <jobId>#(jobId)</jobId> <jobTitle>Software Engg 7</jobTitle> <jobDescription>To develop andriod applications testing xml!!</jobDescription> <experience> <experience>Google</experience> <experience>Playstation</experience> </experience> <project> <project> <projectName>Movie Applications</projectName> <technology> <technology>Docker</technology> </technology> </project> </project> </item>
    And headers {Accept: 'application/xml', Content-Type: 'application/xml'}	
  	When method post
  	And status 201
  	#Then match response/Job/jobId == "7"
  	And print response	
  	
  	