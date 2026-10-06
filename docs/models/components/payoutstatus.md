# PayoutStatus

The status of the payout.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PayoutStatus::REQUESTED

# Open enum: use .deserialize() to create instances from custom string values
custom = PayoutStatus.deserialize("custom_value")
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `REQUESTED`          | requested            |
| `INITIATED`          | initiated            |
| `PROCESSING_AT_BANK` | processing-at-bank   |
| `COMPLETED`          | completed            |
| `FAILED`             | failed               |
| `CANCELED`           | canceled             |