# GetNextSettlementStatus

The status of the settlement.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = GetNextSettlementStatus::OPEN

# Open enum: use .deserialize() to create instances from custom string values
custom = GetNextSettlementStatus.deserialize("custom_value")
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `OPEN`               | open                 |
| `PENDING`            | pending              |
| `PROCESSING`         | processing           |
| `PROCESSING_AT_BANK` | processing-at-bank   |
| `PAIDOUT`            | paidout              |
| `FAILED`             | failed               |