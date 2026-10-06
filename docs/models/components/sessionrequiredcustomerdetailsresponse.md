# SessionRequiredCustomerDetailsResponse

Customer details that should be collected during checkout.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SessionRequiredCustomerDetailsResponse::EMAIL

# Open enum: use .deserialize() to create instances from custom string values
custom = SessionRequiredCustomerDetailsResponse.deserialize("custom_value")
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `EMAIL`            | email              |
| `BILLING_ADDRESS`  | billing-address    |
| `SHIPPING_ADDRESS` | shipping-address   |