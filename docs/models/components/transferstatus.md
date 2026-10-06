# TransferStatus

The status of the transfer.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = TransferStatus::REQUESTED

# Open enum: use .deserialize() to create instances from custom string values
custom = TransferStatus.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `REQUESTED`      | requested        |
| `INITIATED`      | initiated        |
| `PENDING_REVIEW` | pending-review   |
| `PROCESSED`      | processed        |
| `FAILED`         | failed           |
| `BLOCKED`        | blocked          |
| `RETURNED`       | returned         |