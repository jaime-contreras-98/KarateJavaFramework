Feature: To upload the file using the Karate Framework
  
  Background: Create and initialize base URL
		Given url 'http://localhost:9897'

  Scenario: To upload a report in the test scenario
		Given path '/normal/webapi/upload'
		# especificar location del archivo, y su nombre, content-type header value
		And multipart file file = { read: 'fileToUpload.txt', fileName: 'fileToUpload.txt', Content-Type: 'multipart/form-data' }
		When method post
		Then status 200
		And print response
		
	Scenario: To upload a report with json file
		Given path '/normal/webapi/upload'
		# especificar location del archivo, y su nombre, content-type header value
		* def fileLocation = '../postrequest/dataPackage/jobEntry.json'
		And multipart file file = { read: '#(fileLocation)', fileName: '#(fileLocation)', Content-Type: 'multipart/form-data' }
		When method post
		Then status 200
		And print response
		And match response.message contains 'jobEntry.json'