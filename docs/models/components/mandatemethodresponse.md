# MandateMethodResponse

Payment method of the mandate.

SEPA Direct Debit and PayPal mandates can be created directly.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = MandateMethodResponse::CREDITCARD

# Open enum: use .deserialize() to create instances from custom string values
custom = MandateMethodResponse.deserialize("custom_value")
```


## Values

| Name          | Value         |
| ------------- | ------------- |
| `CREDITCARD`  | creditcard    |
| `DIRECTDEBIT` | directdebit   |
| `PAYPAL`      | paypal        |