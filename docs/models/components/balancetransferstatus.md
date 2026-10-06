# BalanceTransferStatus

The status of the transfer.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = BalanceTransferStatus::CREATED

# Open enum: use .deserialize() to create instances from custom string values
custom = BalanceTransferStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `CREATED`   | created     |
| `FAILED`    | failed      |
| `SUCCEEDED` | succeeded   |