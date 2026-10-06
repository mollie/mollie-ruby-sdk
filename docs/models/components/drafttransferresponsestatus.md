# DraftTransferResponseStatus

The status of the draft transfer.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = DraftTransferResponseStatus::PENDING_REVIEW

# Open enum: use .deserialize() to create instances from custom string values
custom = DraftTransferResponseStatus.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `PENDING_REVIEW` | pending-review   |
| `APPROVED`       | approved         |
| `DECLINED`       | declined         |