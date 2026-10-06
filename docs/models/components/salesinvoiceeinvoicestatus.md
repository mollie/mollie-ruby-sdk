# SalesInvoiceEInvoiceStatus

The e-invoice submission status for the invoice, if it was configured to be an e-invoice.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceEInvoiceStatus::ISSUING

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoiceEInvoiceStatus.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `ISSUING` | issuing   |
| `ISSUED`  | issued    |
| `FAILED`  | failed    |