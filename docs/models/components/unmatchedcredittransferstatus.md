# UnmatchedCreditTransferStatus

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = UnmatchedCreditTransferStatus::RECEIVED

# Open enum: use .deserialize() to create instances from custom string values
custom = UnmatchedCreditTransferStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `RECEIVED` | received   |
| `MATCHED`  | matched    |
| `RETURNED` | returned   |
| `EXPIRED`  | expired    |