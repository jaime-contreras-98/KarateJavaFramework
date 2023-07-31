Feature: Title of your feature
  I want to use this template for my feature file
  
  #Background: Read data for data driven
  #	* def testData

  Scenario Outline: Data driven test
    Given print '<url>'
    When print '<path>'
    Then print '<method>'
    And print '<status>'

    Examples: 
      | url  									| path 							 | method | status |
      | http://localhost:9897 | /normal/webapi/all | get 		| 200		 |
      | http://localhost:9897 | /normal/webapi/add | post   | 201	   |
      | http://localhost:9897 | /normal/webapi/add | put    | 201	   |
      
  Scenario Outline: Data Driven for the job description entry - <jobId>
  	Given url 'http://localhost:9897'
  	And path '/normal/webapi/add'
  	And request  { "jobId": '#(jobId)' , "jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status <status>

    Examples: 
      | jobId | jobTitle 					 | jobDescription 				 | status |
      | 9488  | Software Engg 9488 | To develop andriod apps | 201	  |
      | 1468  | Software Engg 1468 | To develop andriod apps | 201	  |
      | 0929  | Software Engg 0929 | To develop andriod apps | 201	  |
      
  Scenario Outline: Data Driven for the job description entry from external file - <jobId>
  	Given url 'http://localhost:9897'
  	And path '/normal/webapi/add'
  	And request  { "jobId": '#(jobId)' , "jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": [ "Google", "Apple", "Mobile Iron" ], "project":[ { "projectName": "Movie App", "technology":[ "Gradle", "Javascript" ]}]}
    And headers {Accept: 'application/json', Content-Type: 'application/json'}	
  	When method post
  	And status <status>

    Examples: 
      #| testData | 
      | read("testData.csv") |
