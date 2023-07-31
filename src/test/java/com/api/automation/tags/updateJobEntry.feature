Feature: To test the updation of Job entry in the test application
  Test the endpoint PUT /normal/webapi/update

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: Update a Job entry for exiting job in JSON Format
    Given path '/normal/webapi/add'
    * def randomNumber = function(){ return Math.floor((100) * Math.random()); }
    * def newId = randomNumber()
    And request  { "jobId": '#(newId)', "jobTitle":"Software Engg 4 MODIFIED", "jobDescription":"To develop andriod applications!!!!", "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    Then print response
    Given path '/normal/webapi/update'
    And request
      """
       {
       		"jobId": '#(newId)',
       		"jobTitle":"Software Engg 4 BLABLABLA",
       		"jobDescription":"To develop andriod applications put request",
       		"experience": [
       				"Google",
       				"Apple",
       				"Mobile Iron",
                       "Automation",
                       "Expert"
       		 ],
       		"project":[
       		{
       			"projectName":
       				"Movie App",
       				"technology":[
       					"Kotlin",
       					"SQL Lite",
       					"Gradle",
       					"Jenkins!!!!!!"
       				]
       			},
       			{
                   "projectName":
       				"Movie App 2",
       				"technology":[
       					"Kotlin 2",
       					"SQL Lite 2",
       					"Gradle 2"
       				]
                   }
       		]
       	}
      """
    When headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    And status 200
    Then print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + newId + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

  Scenario: Update a Job entry for exiting job in JSON Format using the javascript
    Given path '/normal/webapi/add'
    * def randomNumber = function(){ return Math.floor((100) * Math.random()); }
    And request  { "jobId": '#(randomNumber())', "jobTitle":"Software Engg 4 MODIFIED", "jobDescription":"To develop andriod applications!!!!", "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    Then print response
    Given path '/normal/webapi/update'
    And request
      """
       {
       		"jobId": '#(randomNumber())',
       		"jobTitle":"Software Engg 4 BLABLABLA",
       		"jobDescription":"To develop andriod applications put request",
       		"experience": [
       				"Google",
       				"Apple",
       				"Mobile Iron",
                       "Automation",
                       "Expert"
       		 ],
       		"project":[
       		{
       			"projectName":
       				"Movie App",
       				"technology":[
       					"Kotlin",
       					"SQL Lite",
       					"Gradle",
       					"Jenkins!!!!!!"
       				]
       			},
       			{
                   "projectName":
       				"Movie App 2",
       				"technology":[
       					"Kotlin 2",
       					"SQL Lite 2",
       					"Gradle 2"
       				]
                   }
       		]
       	}
      """
    When headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    And status 200
    Then print response

  #* def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + newId + ")].project")
  #And print projectArray
  #And match projectArray[0] == '#[2]'
  Scenario: Update a Job entry for exiting job in JSON Format calling another feature file
    Given call read("../createJobEntryReusablee.feature")
    When path '/normal/webapi/update'
    And request
      """
       {
       		"jobId": 1400,
       		"jobTitle":"Software Engg3214 reusable steps",
       		"jobDescription":"To develop andriod applications put request reusable",
       		"experience": [
       				"Google",
       				"Apple",
       				"Mobile Iron",
                       "Automation",
                       "Expert"
       		 ],
       		"project":[
       		{
       			"projectName":
       				"Movie App",
       				"technology":[
       					"Kotlin",
       					"SQL Lite",
       					"Gradle",
       					"Jenkins!!!!!!"
       				]
       			},
       			{
                   "projectName":
       				"Movie App 2",
       				"technology":[
       					"Kotlin 2",
       					"SQL Lite 2",
       					"Gradle 2"
       				]
                   }
       		]
       	}
      """
    When headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    And status 200
    Then print response

  Scenario: Update a Job entry for exiting job in JSON Format calling another feature file using extern variables
    * def postRequest = call read("../createJobEntryReusablee.feature")
    And print "Calling Feature -> ", postRequest.newId 
    And print "Calling Feature -> ", postRequest.randomNumber() 
    When path '/normal/webapi/update'
    And request
      """
       {
       		"jobId": '#(postRequest.newId)',
       		"jobTitle":"Software Engg3214 reusable steps",
       		"jobDescription":"To develop andriod applications put request reusable",
       		"experience": [
       				"Google",
       				"Apple",
       				"Mobile Iron",
                       "Automation",
                       "Expert"
       		 ],
       		"project":[
       		{
       			"projectName":
       				"Movie App",
       				"technology":[
       					"Kotlin",
       					"SQL Lite",
       					"Gradle",
       					"Jenkins!!!!!!"
       				]
       			},
       			{
                   "projectName":
       				"Movie App 2",
       				"technology":[
       					"Kotlin 2",
       					"SQL Lite 2",
       					"Gradle 2"
       				]
                   }
       		]
       	}
      """
    When headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    And status 200
    Then print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.newId + ")].project")
  	And print projectArray
  	And match projectArray[0] == '#[2]'
  	
  Scenario: Update Job Entry for existing job in JSON format by calling another feature file with variables
    * def randomNumber = function(){ return Math.floor((100) * Math.random()); }
    * def newId = randomNumber()
  	* def postRequest = call read("../createJobEntryWithVariablesReusablee.feature") { _url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(newId)'}
  	
  	Given path '/normal/webapi/update'
  	And request
  	"""
  	{
       		"jobId": '#(newId)',
       		"jobTitle":"Software Engg3214 reusable steps",
       		"jobDescription":"To develop andriod applications put request reusable",
       		"experience": [
       				"Google",
       				"Apple",
       				"Mobile Iron",
                       "Automation",
                       "Expert"
       		 ],
       		"project":[
       		{
       			"projectName":
       				"Movie App",
       				"technology":[
       					"Kotlin",
       					"SQL Lite",
       					"Gradle",
       					"Jenkins!!!!!!"
       				]
       			},
       			{
                   "projectName":
       				"Movie App 2",
       				"technology":[
       					"Kotlin 2",
       					"SQL Lite 2",
       					"Gradle 2"
       				]
                   }
       		]
       	}
  	"""
  	When headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method put
    And status 200
    Then print response
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + newId + ")].project")
  	And print projectArray
  	And match projectArray[0] == '#[2]'
