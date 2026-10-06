# Mode

Whether this entity was created in live mode or in test mode.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = Mode::LIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = Mode.deserialize("custom_value")
```


## Values

| Name   | Value  |
| ------ | ------ |
| `LIVE` | live   |
| `TEST` | test   |