# CaptureResponseStatus

The capture's status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = CaptureResponseStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = CaptureResponseStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `PENDING`   | pending     |
| `SUCCEEDED` | succeeded   |
| `FAILED`    | failed      |