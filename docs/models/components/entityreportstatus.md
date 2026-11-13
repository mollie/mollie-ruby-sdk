# EntityReportStatus

The report's current status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityReportStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityReportStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `PENDING`   | pending     |
| `COMPLETED` | completed   |
| `FAILED`    | failed      |