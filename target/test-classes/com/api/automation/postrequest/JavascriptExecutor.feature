@tag
Feature: To execute the javascript function

  @tag1
  Scenario: Execute javascript function with and without parameter
  	* def getInValue = function() {return 10;}
  	Then print "Function value: ", getInValue() 
  	* def getRandomValue = function() {return Math.floor((100) * Math.random());}
  	Then print "Random value: ", getRandomValue()
  	* def getStringValue = function(arg1) {return "Hello" + arg1;}
  	Then print "Function value string: ", getStringValue("Hola!")