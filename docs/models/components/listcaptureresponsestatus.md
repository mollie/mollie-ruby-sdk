# ListCaptureResponseStatus

The capture's status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListCaptureResponseStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = ListCaptureResponseStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `PENDING`   | pending     |
| `SUCCEEDED` | succeeded   |
| `FAILED`    | failed      |