Feature: Test the homepage

  Background:Define url
    Given url 'https://conduit-api.bondaracademy.com/api/'

  Scenario: Validate the tags are returned and status code is 200
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains 'Git'
    And match response.tags contains ['Blog','Git']
    And match each response.tags == '#string'

  Scenario: Validate the status code of display articles API
    Given params {limit:10,offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles =='#[10]'
    And match response.articles =='#array'
    And match each response.articles[*].author == '#object'
    And match response.articles[0].author == '#object'
    And match karate.sizeOf(response.articles[0].author) ==4