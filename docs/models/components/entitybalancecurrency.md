# EntityBalanceCurrency

The balance's ISO 4217 currency code.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityBalanceCurrency::EUR

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityBalanceCurrency.deserialize("custom_value")
```


## Values

| Name  | Value |
| ----- | ----- |
| `EUR` | EUR   |
| `GBP` | GBP   |
| `CHF` | CHF   |
| `DKK` | DKK   |
| `NOK` | NOK   |
| `PLN` | PLN   |
| `SEK` | SEK   |
| `USD` | USD   |
| `CZK` | CZK   |
| `HUF` | HUF   |
| `AUD` | AUD   |
| `CAD` | CAD   |
| `RON` | RON   |