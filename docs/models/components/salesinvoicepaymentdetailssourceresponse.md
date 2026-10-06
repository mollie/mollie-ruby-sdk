# SalesInvoicePaymentDetailsSourceResponse

The way through which the invoice is to be set to paid.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoicePaymentDetailsSourceResponse::MANUAL

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoicePaymentDetailsSourceResponse.deserialize("custom_value")
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `MANUAL`       | manual         |
| `PAYMENT_LINK` | payment-link   |
| `PAYMENT`      | payment        |