# ReportStatusReasonCode

A machine-readable code for the failure reason.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ReportStatusReasonCode::GENERATION_FAILED

# Open enum: use .deserialize() to create instances from custom string values
custom = ReportStatusReasonCode.deserialize("custom_value")
```


## Values

| Name                | Value               |
| ------------------- | ------------------- |
| `GENERATION_FAILED` | generation-failed   |
| `VALIDATION_FAILED` | validation-failed   |
| `EMPTY_REPORT`      | empty-report        |