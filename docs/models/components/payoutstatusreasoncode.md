# PayoutStatusReasonCode

A machine-readable code describing the reason for the payout's current status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PayoutStatusReasonCode::REQUESTED

# Open enum: use .deserialize() to create instances from custom string values
custom = PayoutStatusReasonCode.deserialize("custom_value")
```


## Values

| Name                     | Value                    |
| ------------------------ | ------------------------ |
| `REQUESTED`              | requested                |
| `INITIATED`              | initiated                |
| `PROCESSING_AT_BANK`     | processing_at_bank       |
| `COMPLETED`              | completed                |
| `CANCELED`               | canceled                 |
| `FAILED`                 | failed                   |
| `INSUFFICIENT_FUNDS`     | insufficient_funds       |
| `RETURNED`               | returned                 |
| `INVALID_REQUEST`        | invalid_request          |
| `ORGANIZATION_INACTIVE`  | organization_inactive    |
| `PAYOUTS_BLOCKED`        | payouts_blocked          |
| `BANK_PROCESSING_FAILED` | bank_processing_failed   |
| `BALANCE_NOT_FOUND`      | balance_not_found        |
| `EXPIRED`                | expired                  |