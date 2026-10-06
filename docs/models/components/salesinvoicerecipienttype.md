# SalesInvoiceRecipientType

The type of recipient, either `consumer` or `business`. This will determine what further fields are
required on the `recipient` object.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceRecipientType::CONSUMER
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `CONSUMER` | consumer   |
| `BUSINESS` | business   |