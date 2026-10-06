# PaymentDetailsWalletResponse

The wallet used when creating the payment.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsWalletResponse::APPLEPAY

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsWalletResponse.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `APPLEPAY`  | applepay    |
| `GOOGLEPAY` | googlepay   |