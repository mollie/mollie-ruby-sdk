# SessionResponseStatus

The Checkout Session's status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SessionResponseStatus::OPEN

# Open enum: use .deserialize() to create instances from custom string values
custom = SessionResponseStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `OPEN`      | open        |
| `COMPLETED` | completed   |
| `EXPIRED`   | expired     |