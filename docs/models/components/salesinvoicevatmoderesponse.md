# SalesInvoiceVatModeResponse

The VAT mode to use for VAT calculation. `exclusive` mode means we will apply the relevant VAT on top of the
price. `inclusive` means the prices you are providing to us already contain the VAT you want to apply.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceVatModeResponse::EXCLUSIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoiceVatModeResponse.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `EXCLUSIVE` | exclusive   |
| `INCLUSIVE` | inclusive   |