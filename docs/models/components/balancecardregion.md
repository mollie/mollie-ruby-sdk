# BalanceCardRegion

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = BalanceCardRegion::INTRA_EEA

# Open enum: use .deserialize() to create instances from custom string values
custom = BalanceCardRegion.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `INTRA_EEA` | intra-eea   |
| `INTRA_EU`  | intra-eu    |
| `DOMESTIC`  | domestic    |
| `OTHER`     | other       |