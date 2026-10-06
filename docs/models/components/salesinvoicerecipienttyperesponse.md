# SalesInvoiceRecipientTypeResponse

The type of recipient, either `consumer` or `business`. This will determine what further fields are
required on the `recipient` object.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceRecipientTypeResponse::CONSUMER

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoiceRecipientTypeResponse.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `CONSUMER` | consumer   |
| `BUSINESS` | business   |