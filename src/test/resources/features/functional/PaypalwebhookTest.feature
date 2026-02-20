Feature: End to end test of Webhook create get delete and get

  Background: Define url and accessToken
    Given url 'https://api-m.sandbox.paypal.com'
    * def tokenApiRes = callonce read("classpath:helpers/PaypalTokenGenerator.feature")
    * def access_token = tokenApiRes.accessToken

  @smoke
  Scenario: Create a webhook
    Given path 'v1/notifications/webhooks'
    And header Authorization = 'Bearer '+access_token
    And header Content-Type = 'application/json'
    * def ts = java.lang.System.currentTimeMillis()
    * def targetUrl = 'https://webhook.site/5d271286-ed2b-48c5-8f84-87c5c5c2a029?run='+ts
    And request {"url": "#(targetUrl)","event_types": [{"name": "*"}]}
    When method Post
    Then status 201
    And match response.id == "#string"
    And match response.id != null
    And match response.event_types == '#array'
    * def createdWebhookId = response.id

  #Scenario: Fetch a webhook
    Given path 'v1/notifications/webhooks'
    And header Authorization = 'Bearer '+access_token
    When method Get
    Then status 200
    And assert response.webhooks.length > 0
    And match response.webhooks[*].id contains createdWebhookId


  #Scenario: Delete a webhook
    Given path 'v1/notifications/webhooks/' + createdWebhookId
    And header Authorization = 'Bearer '+access_token
    When method Delete
    Then status 204

  #Scenario: Fetch a webhook
    Given path 'v1/notifications/webhooks'
    And header Authorization = 'Bearer '+access_token
    When method Get
    Then status 200
    And assert response.webhooks.length == 0
    And match response.webhooks.id == '#notpresent'

