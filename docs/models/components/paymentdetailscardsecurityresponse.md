# PaymentDetailsCardSecurityResponse

The level of security applied during card processing.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsCardSecurityResponse::NORMAL

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsCardSecurityResponse.deserialize("custom_value")
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `NORMAL`       | normal         |
| `THREEDSECURE` | 3dsecure       |