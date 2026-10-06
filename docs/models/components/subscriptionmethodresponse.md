# SubscriptionMethodResponse

The payment method used for this subscription. If omitted, any of the customer's valid mandates may be used.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SubscriptionMethodResponse::CREDITCARD

# Open enum: use .deserialize() to create instances from custom string values
custom = SubscriptionMethodResponse.deserialize("custom_value")
```


## Values

| Name          | Value         |
| ------------- | ------------- |
| `CREDITCARD`  | creditcard    |
| `DIRECTDEBIT` | directdebit   |
| `PAYPAL`      | paypal        |