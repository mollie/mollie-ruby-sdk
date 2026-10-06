# BalanceTransferDestinationType

The default destination of automatic scheduled transfers. Currently only `bank-account` is supported.

* `bank-account` — Transfer the balance amount to an external bank account

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = BalanceTransferDestinationType::BANK_ACCOUNT

# Open enum: use .deserialize() to create instances from custom string values
custom = BalanceTransferDestinationType.deserialize("custom_value")
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `BANK_ACCOUNT` | bank-account   |