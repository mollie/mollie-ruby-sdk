# EntityTerminalStatus

The status of the terminal.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityTerminalStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityTerminalStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `PENDING`  | pending    |
| `ACTIVE`   | active     |
| `INACTIVE` | inactive   |