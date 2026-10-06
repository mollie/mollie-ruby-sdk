# SalesInvoiceDiscountTypeResponse

The type of discount.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SalesInvoiceDiscountTypeResponse::AMOUNT

# Open enum: use .deserialize() to create instances from custom string values
custom = SalesInvoiceDiscountTypeResponse.deserialize("custom_value")
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `AMOUNT`     | amount       |
| `PERCENTAGE` | percentage   |