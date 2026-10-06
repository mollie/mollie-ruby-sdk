# PaymentDetailsCardAuditionResponse

The card's target audience, if known.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsCardAuditionResponse::CONSUMER

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsCardAuditionResponse.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `CONSUMER` | consumer   |
| `BUSINESS` | business   |