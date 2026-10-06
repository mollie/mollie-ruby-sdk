# ListMandateResponseStatus

The status of the mandate. A status can be `pending` for mandates when the first payment is not yet finalized, or
when we did not received the IBAN yet from the first payment.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListMandateResponseStatus::VALID

# Open enum: use .deserialize() to create instances from custom string values
custom = ListMandateResponseStatus.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `VALID`   | valid     |
| `PENDING` | pending   |
| `INVALID` | invalid   |