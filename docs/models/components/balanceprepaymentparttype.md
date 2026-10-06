# BalancePrepaymentPartType

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = BalancePrepaymentPartType::FEE

# Open enum: use .deserialize() to create instances from custom string values
custom = BalancePrepaymentPartType.deserialize("custom_value")
```


## Values

| Name                        | Value                       |
| --------------------------- | --------------------------- |
| `FEE`                       | fee                         |
| `FEE_REIMBURSEMENT`         | fee-reimbursement           |
| `FEE_DISCOUNT`              | fee-discount                |
| `FEE_VAT`                   | fee-vat                     |
| `FEE_ROUNDING_COMPENSATION` | fee-rounding-compensation   |