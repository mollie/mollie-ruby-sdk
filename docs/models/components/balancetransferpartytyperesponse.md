# BalanceTransferPartyTypeResponse

Defines the type of the party. At the moment, only `organization` is supported.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = BalanceTransferPartyTypeResponse::ORGANIZATION

# Open enum: use .deserialize() to create instances from custom string values
custom = BalanceTransferPartyTypeResponse.deserialize("custom_value")
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `ORGANIZATION` | organization   |