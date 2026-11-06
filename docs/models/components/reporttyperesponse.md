# ReportTypeResponse

The type of report to generate. Determines which other fields the request needs, and which fields show up
on the resulting report.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ReportTypeResponse::TRANSACTION_MARGIN

# Open enum: use .deserialize() to create instances from custom string values
custom = ReportTypeResponse.deserialize("custom_value")
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `TRANSACTION_MARGIN` | transaction_margin   |