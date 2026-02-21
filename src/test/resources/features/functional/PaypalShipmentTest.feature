Feature: Test the paypal shipment tracking API

  Background: Fetch the access token
    Given url payPalUrl
    * def tokenApires = callonce read('classpath:helpers/PaypalTokenGenerator.feature')
    * def access_token = tokenApires.accessToken

  Scenario Outline: Negative test
    Given path 'v2/pricing/quote-exchange-rates'
    And header Authorization = 'Bearer '+access_token
    And header Content-Type = 'application/json'

    And request
      """
      {
    "quote_items": [
        {
            "base_currency": "<currency>",
            "base_amount": "<amount>",
            "quote_currency": "<quote>"
        }
    ]
}
      """
    When method Post
    Then status <status>
    #And match response = <errorResp>
    Examples:
      | currency | amount | quote | status | errorResp                                                                                                                                                                                                                                              |
      | Rs       | 20.00  | CAD   | 403    | {"name": "VALIDATION_ERROR","message": "Invalid request - see details","debug_id": "f969701250eed","details": [{"field": "baseAmount","value": "-20.00","location": "body","issue": "INVALID_PARAMETER_SYNTAX"}],"links": []}                          |
      | USD      | 20.00  | CAD1  | 403    | {"name": "VALIDATION_ERROR","message": "Invalid request - see details","debug_id": "f596895ed2942","details": [{"issue": "java.lang.IllegalArgumentException: Quote/Base Invalid ISO currency codeQuote/Base Invalid ISO currency code"}],"links": []} |
      | USD      | -20.00 | CAD   | 403    | {"name": "VALIDATION_ERROR","message": "Invalid request - see details","debug_id": "f931538ba4e0a","details": [{"field": "baseAmount","value": "-20.00","location": "body","issue": "INVALID_PARAMETER_SYNTAX"}],"links": []}                          |

