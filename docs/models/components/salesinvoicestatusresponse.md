# SalesInvoiceStatusResponse

The current status of the invoice.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceStatusResponse::DRAFT

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoiceStatusResponse.deserialize("custom_value")
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `DRAFT`            | draft              |
| `ISSUING`          | issuing            |
| `ISSUED`           | issued             |
| `PENDING_PAYMENT`  | pending-payment    |
| `PAID`             | paid               |
| `OVERDUE`          | overdue            |
| `PAYMENT_REVERSED` | payment-reversed   |
| `CANCELLED`        | cancelled          |
| `EXPIRED`          | expired            |
| `FAILED`           | failed             |