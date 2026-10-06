# TransactionType

Indicates what kind of transaction this is.

We may introduce new transaction types as we expand the product. We recommend building your integration
to handle unexpected values gracefully, so nothing breaks when that happens. 

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = TransactionType::CARD_PAYMENT

# Open enum: use .deserialize() to create instances from custom string values
custom = TransactionType.deserialize("custom_value")
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `CARD_PAYMENT`        | card-payment          |
| `BANK_TRANSFER`       | bank-transfer         |
| `PSP_TRANSFER`        | psp-transfer          |
| `INTERNAL_TRANSFER`   | internal-transfer     |
| `IDEAL_PAYMENT`       | ideal-payment         |
| `FEE`                 | fee                   |
| `CORRECTION`          | correction            |
| `DIRECT_DEBIT`        | direct-debit          |
| `DIRECT_DEBIT_REFUND` | direct-debit-refund   |
| `REWARDS_PAYOUT`      | rewards-payout        |