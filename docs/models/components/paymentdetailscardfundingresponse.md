# PaymentDetailsCardFundingResponse

The card type.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PaymentDetailsCardFundingResponse::DEBIT

# Open enum: use .deserialize() to create instances from custom string values
custom = PaymentDetailsCardFundingResponse.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `DEBIT`          | debit            |
| `CREDIT`         | credit           |
| `PREPAID`        | prepaid          |
| `DEFERRED_DEBIT` | deferred-debit   |