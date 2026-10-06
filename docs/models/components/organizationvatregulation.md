# OrganizationVatRegulation

Mollie applies Dutch VAT for merchants based in The Netherlands, British VAT for merchants based in The United
Kingdom, and shifted VAT for merchants in the European Union.

The field is not present for merchants residing in other countries.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = OrganizationVatRegulation::DUTCH

# Open enum: use .deserialize() to create instances from custom string values
custom = OrganizationVatRegulation.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `DUTCH`   | dutch     |
| `BRITISH` | british   |
| `SHIFTED` | shifted   |