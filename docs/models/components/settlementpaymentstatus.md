# SettlementPaymentStatus

The payment's status. Settlement payments always have a status of `paid`.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SettlementPaymentStatus::PAID

# Open enum: use .deserialize() to create instances from custom string values
custom = SettlementPaymentStatus.deserialize("custom_value")
```


## Values

| Name   | Value  |
| ------ | ------ |
| `PAID` | paid   |