# PaymentResponseStatus

The payment's status. Refer to the [documentation regarding statuses](https://docs.mollie.com/docs/handling-payment-status) for more info about which
statuses occur at what point.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentResponseStatus::OPEN

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentResponseStatus.deserialize("custom_value")
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `OPEN`       | open         |
| `PENDING`    | pending      |
| `AUTHORIZED` | authorized   |
| `PAID`       | paid         |
| `CANCELED`   | canceled     |
| `EXPIRED`    | expired      |
| `FAILED`     | failed       |