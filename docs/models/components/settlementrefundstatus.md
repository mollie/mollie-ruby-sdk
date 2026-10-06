# SettlementRefundStatus

The refund's status. Settlement refunds are normally `refunded`, but can be `failed` if the refund
could not be processed.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SettlementRefundStatus::REFUNDED

# Open enum: use .deserialize() to create instances from custom string values
custom = SettlementRefundStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `REFUNDED` | refunded   |
| `FAILED`   | failed     |