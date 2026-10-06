# SettlementCaptureStatus

The capture's status. Settlement captures always have a status of `succeeded`.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = SettlementCaptureStatus::SUCCEEDED

# Open enum: use .deserialize() to create instances from custom string values
custom = SettlementCaptureStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `SUCCEEDED` | succeeded   |