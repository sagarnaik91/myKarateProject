Feature: Paypal test

  Background: Define url
    Given url 'https://api-m.sandbox.paypal.com'
    * def clientId = 'AQV5GfG1KCuIP2YLegv95MUSBo_PeOfBAMU5f2cL-bqOcIG98ZoaqAjXfkW4ysbi5VujgIlxSDYLfpCt'
    * def clientSecret = 'EB7jQzo5EyMM9LKx5-zVIS3gohhT7vzGvUQQzc2dQ9bYtGoVoJlG5pmDZblyQDdv0m6C3nGoQd5ws-Ct'
    * def creds = clientId + ':' + clientSecret
    * def Base64 = Java.type('java.util.Base64')
    Given header Authorization = 'Basic ' + Base64.getEncoder().encodeToString(creds.getBytes('utf-8'))

  Scenario: Create access token and execute create order api and validate status code 200
    Given path 'v1/oauth2/token'
    Given header Content-Type = 'application/x-www-form-urlencoded'
    Given form field grant_type = 'client_credentials'
    When method post
    Then status 200
    * def accessToken = response.access_token

    Given path 'v2/checkout/orders'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer '+accessToken
    And request {"intent": "CAPTURE","purchase_units": [{"reference_id": "d9f80740-38f0-11e8-b467-0ed5f89f718b","amount": {"currency_code": "USD","value": "100.00"}}]}
    When method post
    Then status 201
    And match response.status =='CREATED'
