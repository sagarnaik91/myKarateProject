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

  Scenario: Verify the id field contains number 1 to 10 of the objects API
    When method Get
    Then status 200
    And match response[*].id contains only ['1','2','3','4','5','6','7','8','9','10','11','12','13']
    And match response[*].id =='#[13]'