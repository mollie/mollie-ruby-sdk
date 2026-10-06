# ListEntityTerminalStatus

The status of the terminal.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListEntityTerminalStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = ListEntityTerminalStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `PENDING`  | pending    |
| `ACTIVE`   | active     |
| `INACTIVE` | inactive   |