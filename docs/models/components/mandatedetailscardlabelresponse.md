# MandateDetailsCardLabelResponse

The card's label. Available for card mandates, if the card label could be detected.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = MandateDetailsCardLabelResponse::AMERICAN_EXPRESS

# Open enum: use .deserialize() to create instances from custom string values
custom = MandateDetailsCardLabelResponse.deserialize("custom_value")
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `AMERICAN_EXPRESS` | American Express   |
| `CARTA_SI`         | Carta Si           |
| `CARTE_BLEUE`      | Carte Bleue        |
| `CARTES_BANCAIRES` | Cartes Bancaires   |
| `DANKORT`          | Dankort            |
| `DINERS_CLUB`      | Diners Club        |
| `DISCOVER`         | Discover           |
| `JCB`              | JCB                |
| `LASER`            | Laser              |
| `MAESTRO`          | Maestro            |
| `MASTERCARD`       | Mastercard         |
| `UNIONPAY`         | Unionpay           |
| `VISA`             | Visa               |