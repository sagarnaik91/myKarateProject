Feature: Paypal token generator

  Scenario: Generate the bearer token for paypal
    Given url 'https://api-m.sandbox.paypal.com'
    Given path 'v1/oauth2/token'
    * def clientId = clientId
    * def clientSecret = clientSecret
    * def creds = clientId + ':' + clientSecret
    * def Base64 = Java.type('java.util.Base64')
    Given header Authorization = 'Basic '+Base64.getEncoder().encodeToString(creds.getBytes('utf-8'))
    Given header Content-Type = 'application/x-www-form-urlencoded'
    Given form field grant_type = 'client_credentials'
    When method Post
    Then status 200
    * def accessToken = response.access_token