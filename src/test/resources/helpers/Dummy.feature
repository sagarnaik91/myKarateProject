Feature: Dummy

  Scenario: Create random city name
    * print '>>> Dummy.feature called'
    * def DataGenerator = Java.type('utils.DataGenerator')
    * def city = DataGenerator.getCity()
    * print 'city is ->'+city