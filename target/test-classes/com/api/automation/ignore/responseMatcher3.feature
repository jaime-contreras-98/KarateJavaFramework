@ignore
Feature: To validate the GET Endpoint
  To validate the get endpoint reponse

  Background: Setup the base url
    Given url 'http://localhost:9897'

   Scenario: To contain the data in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match /List/item/project/project/technology/technology[1] == 'Kotlin'
    And match /List/item/project/project/technology/technology[2] == 'SQL Lite'
    And match response.List.item.experience.experience[0] == 'Google'
    
   Scenario: To get the data in json format and validate using fuzzy matcher SIMILAR TO BOOLEANS
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == '#present' 
    #And match response.[0].experience[1] == '#notnull' 
    And match response.[0].project[0].projectName == '#ignore' 
    And match response.[0].project[0].technology == '#array' 
    And match response.[0].jobTitle == '#string' 
    And match response.[0].jobId == '#number' 
    
   Scenario: To contain the data in xml format using fuzzy matcher SIMILAR TO BOOLEANS
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match /List/item/project/project/technology/technology[1] == 'Kotlin'
    And match /List/item/project/project/technology/technology[2] == 'SQL Lite'
    And match response.List.item.experience.experience[0] == 'Google'
    And match response/List/item/jobId == '#ignore'
    And match response/List/item/jobTitle == '#string'  
    # And match response/List/item/experience/experience[1] == '#array' 
    And match response/List/item/project/project/projectName == '#present' 
    And match response/List/item/project/project/technology/technology[2] == '#ignore' 
    
   Scenario: To contain the data in xml format using fuzzy matcher SIMILAR TO BOOLEANS
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == '#present' 
    #And match response.[0].experience[1] == '#notnull' 
    And match response.[0].project[0].projectName == '#ignore' 
    And match response.[0].project[0].technology == '#array' 
    And match response.[0].jobTitle == '#string' 
    And match response.[0].jobId == '#number' 
    #Complex Fuzzy matcher, la de abajo es javascript (self function) y reemplaza el valor 
    And match response.[0].jobId == '#? _ == 1' 
    And match response.[0].jobTitle == '#string? _.length >= 1' 
    And match response.[0].jobTitle == '#string? _.length == 13' 
    # To validate the array
    And match response.[0].experience == '#[]' 
    And match response.[0].experience == '#[3]' 
    # confirmar que es un array de strings
    And match response.[0].experience == '#[3] #string' 
    And match response.[0].experience == '#[3] #string? _.length >= 2' 
    
   Scenario: To contain the data in xml format using fuzzy matcher SIMILAR TO BOOLEANS
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match /List/item/project/project/technology/technology[1] == 'Kotlin'
    And match /List/item/project/project/technology/technology[2] == 'SQL Lite'
    And match response.List.item.experience.experience[0] == 'Google'
    And match response/List/item/jobId == '#ignore'
    And match response/List/item/jobTitle == '#string'  
    # And match response/List/item/experience/experience[1] == '#array' 
    And match response/List/item/project/project/projectName == '#present' 
    And match response/List/item/project/project/technology/technology[2] == '#ignore'
    #Complex Fuzzy matcher, la de abajo es javascript (self function) y reemplaza el valor 
    And match response/List/item/jobTitle == '#string? _.length == 13' 
    And match response/List/item/jobTitle.id == '#notpresent'  
    
    