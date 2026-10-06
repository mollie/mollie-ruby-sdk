# PaymentDetailsFailureReasonResponse

A failure code to help understand why the payment failed.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsFailureReasonResponse::AUTHENTICATION_ABANDONED

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsFailureReasonResponse.deserialize("custom_value")
```


## Values

| Name                             | Value                            |
| -------------------------------- | -------------------------------- |
| `AUTHENTICATION_ABANDONED`       | authentication_abandoned         |
| `AUTHENTICATION_FAILED`          | authentication_failed            |
| `AUTHENTICATION_REQUIRED`        | authentication_required          |
| `AUTHENTICATION_UNAVAILABLE_ACS` | authentication_unavailable_acs   |
| `CARD_DECLINED`                  | card_declined                    |
| `CARD_EXPIRED`                   | card_expired                     |
| `INACTIVE_CARD`                  | inactive_card                    |
| `INSUFFICIENT_FUNDS`             | insufficient_funds               |
| `INVALID_CVV`                    | invalid_cvv                      |
| `INVALID_CARD_HOLDER_NAME`       | invalid_card_holder_name         |
| `INVALID_CARD_NUMBER`            | invalid_card_number              |
| `INVALID_CARD_TYPE`              | invalid_card_type                |
| `POSSIBLE_FRAUD`                 | possible_fraud                   |
| `REFUSED_BY_ISSUER`              | refused_by_issuer                |
| `UNKNOWN_REASON`                 | unknown_reason                   |