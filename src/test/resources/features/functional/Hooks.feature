@uu @parallel=true
Feature: Hooks

  Background: Get the city name
#    * def result = call read("classpath:helpers/Dummy.feature")
#    * def city = result.city

    * configure afterScenario = function(){karate.call("classpath:helpers/Dummy.feature")}

  Scenario: Scenario1
    * print 'Scenario1->'

  Scenario: Scenario2
    * print 'Scenario2->'