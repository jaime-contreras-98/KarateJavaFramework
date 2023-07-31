Feature: To create the job entry in the test application
	Helper file for POST /normal/webappi/add

  Scenario: Update a Job entry for exiting job in JSON Format
  	Given url _url
    And path _path
    And print "Helper -> ", _url
    And print "Helper -> ", _path
    And print "Helper -> ", _id
  	And request  { "jobId": '#(_id)', "jobTitle":"Software Engg REUSABLE", "jobDescription":"To develop andriod applications!!!!", "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status 201
  	Then print response
  	* def responseJobId = response.jobId
		* def responseJobTitle = response.jobTitle