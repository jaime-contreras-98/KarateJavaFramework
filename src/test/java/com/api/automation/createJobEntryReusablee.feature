Feature: To create the job entry in the test application
	Helper file for POST /normal/webappi/add

  Scenario: Update a Job entry for exiting job in JSON Format
  	Given url 'http://localhost:9897' 
    And path '/normal/webapi/add'
    * def randomNumber = function(){ return Math.floor((100) * Math.random()); }
    * def newId = randomNumber()
  	And request  { "jobId": '#(newId)', "jobTitle":"Software Engg 4 MODIFIED", "jobDescription":"To develop andriod applications!!!!", "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status 201
  	Then print response
  	* def responseJobId = response.jobId
