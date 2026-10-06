# ListRefundResponseStatus

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListRefundResponseStatus::QUEUED

# Open enum: use .deserialize() to create instances from custom string values
custom = ListRefundResponseStatus.deserialize("custom_value")
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `QUEUED`     | queued       |
| `PENDING`    | pending      |
| `PROCESSING` | processing   |
| `REFUNDED`   | refunded     |
| `FAILED`     | failed       |
| `CANCELED`   | canceled     |