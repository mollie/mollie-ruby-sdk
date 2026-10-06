# GiftcardStatus

The status of the issuer.
If the status is `pending-issuer`, an additional action from your side may be required with the issuer.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = GiftcardStatus::ACTIVATED

# Open enum: use .deserialize() to create instances from custom string values
custom = GiftcardStatus.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `ACTIVATED`      | activated        |
| `PENDING_ISSUER` | pending-issuer   |