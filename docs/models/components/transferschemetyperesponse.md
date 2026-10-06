# TransferSchemeTypeResponse

The transfer scheme to be used for the transfer. The transfer scheme determines the processing time and method of the transfer.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = TransferSchemeTypeResponse::SEPA_CREDIT_INST

# Open enum: use .deserialize() to create instances from custom string values
custom = TransferSchemeTypeResponse.deserialize("custom_value")
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `SEPA_CREDIT_INST` | sepa-credit-inst   |
| `SEPA_CREDIT`      | sepa-credit        |