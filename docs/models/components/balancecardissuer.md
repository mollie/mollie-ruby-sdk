# BalanceCardIssuer

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = BalanceCardIssuer::AMEX

# Open enum: use .deserialize() to create instances from custom string values
custom = BalanceCardIssuer.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `AMEX`           | amex             |
| `MAESTRO`        | maestro          |
| `CARTE_BANCAIRE` | carte-bancaire   |
| `OTHER`          | other            |