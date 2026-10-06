# StatusReasonTerminalResponse

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = StatusReasonTerminalResponse::TERMINAL_BUSY

# Open enum: use .deserialize() to create instances from custom string values
custom = StatusReasonTerminalResponse.deserialize("custom_value")
```


## Values

| Name                   | Value                  |
| ---------------------- | ---------------------- |
| `TERMINAL_BUSY`        | terminal_busy          |
| `TERMINAL_UNREACHABLE` | terminal_unreachable   |