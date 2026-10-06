# StatusReasonCodeResponse

A machine-readable code indicating the reason for the transfer's terminal status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = StatusReasonCodeResponse::INSUFFICIENT_FUNDS

# Open enum: use .deserialize() to create instances from custom string values
custom = StatusReasonCodeResponse.deserialize("custom_value")
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `INSUFFICIENT_FUNDS` | insufficient-funds   |
| `REJECTED`           | rejected             |
| `ERROR`              | error                |