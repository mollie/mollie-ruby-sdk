# CreditDebitIndicator

Indicates whether the entry is a credit or debit from the perspective of the account holder.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = CreditDebitIndicator::CREDIT

# Open enum: use .deserialize() to create instances from custom string values
custom = CreditDebitIndicator.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `CREDIT` | credit   |
| `DEBIT`  | debit    |