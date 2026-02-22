Feature: Currency exchange test

  Background: Create access toke
    Given url payPalUrl
    * def tokenApiResp = callonce read('classpath:helpers/PaypalTokenGenerator.feature')
    * def access_token = tokenApiResp.accessToken

    Scenario Outline: Create currency exchange
      Given path '/v2/pricing/quote-exchange-rates'
      * def auth = 'Bearer '+access_token
      And headers  { Authorization : '#(auth)', Content-Type:'application/json'}
      * def body = read ('classpath:data/CurrencyExchange.json')
      And request body
      When method post
      Then status <status>
      Examples:
        | currency | amount | quote | status | errorResp                                                                                                                                                                                                                                              |
        | Rs       | 20.00  | CAD   | 403    | {"name": "VALIDATION_ERROR","message": "Invalid request - see details","debug_id": "f969701250eed","details": [{"field": "baseAmount","value": "-20.00","location": "body","issue": "INVALID_PARAMETER_SYNTAX"}],"links": []}                          |
        | USD      | 20.00  | CAD1  | 403    | {"name": "VALIDATION_ERROR","message": "Invalid request - see details","debug_id": "f596895ed2942","details": [{"issue": "java.lang.IllegalArgumentException: Quote/Base Invalid ISO currency codeQuote/Base Invalid ISO currency code"}],"links": []} |
        | USD      | -20.00 | CAD   | 403    | {"name": "VALIDATION_ERROR","message": "Invalid request - see details","debug_id": "f931538ba4e0a","details": [{"field": "baseAmount","value": "-20.00","location": "body","issue": "INVALID_PARAMETER_SYNTAX"}],"links": []}                          |