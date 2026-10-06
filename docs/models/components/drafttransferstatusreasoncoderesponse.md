# DraftTransferStatusReasonCodeResponse

A machine-readable code that indicates the reason for the draft transfer's current status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = DraftTransferStatusReasonCodeResponse::DELETED_BY_CREATOR

# Open enum: use .deserialize() to create instances from custom string values
custom = DraftTransferStatusReasonCodeResponse.deserialize("custom_value")
```


## Values

| Name                    | Value                   |
| ----------------------- | ----------------------- |
| `DELETED_BY_CREATOR`    | deleted-by-creator      |
| `DECLINED_BY_INITIATOR` | declined-by-initiator   |
| `ACCOUNT_CLOSED`        | account-closed          |