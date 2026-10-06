# EntityBalanceTransferFrequency

The frequency with which the available amount on the balance will be settled to the configured transfer
destination.

Settlements created during weekends or on bank holidays will take place on the next business day.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityBalanceTransferFrequency::EVERY_DAY

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityBalanceTransferFrequency.deserialize("custom_value")
```


## Values

| Name              | Value             |
| ----------------- | ----------------- |
| `EVERY_DAY`       | every-day         |
| `DAILY`           | daily             |
| `EVERY_MONDAY`    | every-monday      |
| `EVERY_TUESDAY`   | every-tuesday     |
| `EVERY_WEDNESDAY` | every-wednesday   |
| `EVERY_THURSDAY`  | every-thursday    |
| `EVERY_FRIDAY`    | every-friday      |
| `MONTHLY`         | monthly           |
| `REVENUE_DAY`     | revenue-day       |
| `NEVER`           | never             |