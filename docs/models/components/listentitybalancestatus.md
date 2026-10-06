# ListEntityBalanceStatus

The status of the balance.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListEntityBalanceStatus::ACTIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = ListEntityBalanceStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `ACTIVE`   | active     |
| `INACTIVE` | inactive   |