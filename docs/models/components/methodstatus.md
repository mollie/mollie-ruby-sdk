# MethodStatus

The payment method's activation status for this profile.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = MethodStatus::ACTIVATED

# Open enum: use .deserialize() to create instances from custom string values
custom = MethodStatus.deserialize("custom_value")
```


## Values

| Name               | Value              |
| ------------------ | ------------------ |
| `ACTIVATED`        | activated          |
| `PENDING_BOARDING` | pending-boarding   |
| `PENDING_REVIEW`   | pending-review     |
| `PENDING_EXTERNAL` | pending-external   |
| `REJECTED`         | rejected           |