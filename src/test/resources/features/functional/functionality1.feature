Feature: Verify object data from restful-api.dev

  Background:
    # Base URL and common path
    * url 'https://api.restful-api.dev'
    * path 'objects'
    * configure headers = { 'Content-Type': 'application/json', 'Accept': 'application/json' }

    # Uncomment and set credentials if Basic Auth is actually required
    # * def creds = 'username:password'
    # * header Authorization = 'Basic ' + karate.encodeBase64(creds)

  Scenario: Verify that data.year for object 7 is 2019
    Given path '7'
    When method get
    Then status 200
    And match response.data.year == 2019
    * print 'data.year =', response.data.year