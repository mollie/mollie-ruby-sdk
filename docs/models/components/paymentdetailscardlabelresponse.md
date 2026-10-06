# PaymentDetailsCardLabelResponse

The card's label, if known.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsCardLabelResponse::AMERICAN_EXPRESS

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsCardLabelResponse.deserialize("custom_value")
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
| `VPAY`             | Vpay               |