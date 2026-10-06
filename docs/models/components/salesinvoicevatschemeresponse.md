# SalesInvoiceVatSchemeResponse

The VAT scheme to create the invoice for. You must be enrolled with One Stop Shop enabled to use it.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceVatSchemeResponse::STANDARD

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoiceVatSchemeResponse.deserialize("custom_value")
```


## Values

| Name            | Value           |
| --------------- | --------------- |
| `STANDARD`      | standard        |
| `ONE_STOP_SHOP` | one-stop-shop   |