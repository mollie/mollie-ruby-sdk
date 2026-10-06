# EntityBalanceStatus

The status of the balance.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityBalanceStatus::ACTIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityBalanceStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `ACTIVE`   | active     |
| `INACTIVE` | inactive   |