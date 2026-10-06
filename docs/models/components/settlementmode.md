# SettlementMode

Whether this entity was created in live mode or in test mode. Settlements are always in live mode.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SettlementMode::LIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = SettlementMode.deserialize("custom_value")
```


## Values

| Name   | Value  |
| ------ | ------ |
| `LIVE` | live   |