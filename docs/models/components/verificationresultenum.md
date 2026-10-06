# VerificationResultEnum

The result of the Verification of Payee check.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = VerificationResultEnum::MATCH

# Open enum: use .deserialize() to create instances from custom string values
custom = VerificationResultEnum.deserialize("custom_value")
```


## Values

| Name            | Value           |
| --------------- | --------------- |
| `MATCH`         | match           |
| `NO_MATCH`      | no-match        |
| `CLOSE_MATCH`   | close-match     |
| `NOT_AVAILABLE` | not-available   |