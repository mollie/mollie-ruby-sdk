# ListEntityInvoiceStatus

Status of the invoice.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListEntityInvoiceStatus::OPEN

# Open enum: use .deserialize() to create instances from custom string values
custom = ListEntityInvoiceStatus.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `OPEN`    | open      |
| `PAID`    | paid      |
| `OVERDUE` | overdue   |