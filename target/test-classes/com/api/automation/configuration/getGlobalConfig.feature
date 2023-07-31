@tag
Feature: To get the variables set by Karate-config.js file

	Background: To get the value of myVarName
		* def localMyVarName = myVarName
		Given print "Background Variable value ->", localMyVarName

  @tag1
  Scenario: To get the value of username and password from karate-config.js
  	* def localusername = username
  	Given print "Scenario variable value ->", localusername
  	And print "Scenario Variable value ->", password
