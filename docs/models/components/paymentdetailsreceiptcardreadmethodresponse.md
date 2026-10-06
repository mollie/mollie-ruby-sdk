# PaymentDetailsReceiptCardReadMethodResponse

The method by which the card was read by the terminal.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsReceiptCardReadMethodResponse::CHIP

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsReceiptCardReadMethodResponse.deserialize("custom_value")
```


## Values

| Name                       | Value                      |
| -------------------------- | -------------------------- |
| `CHIP`                     | chip                       |
| `MAGNETIC_STRIPE`          | magnetic-stripe            |
| `NEAR_FIELD_COMMUNICATION` | near-field-communication   |
| `CONTACTLESS`              | contactless                |
| `MOTO`                     | moto                       |