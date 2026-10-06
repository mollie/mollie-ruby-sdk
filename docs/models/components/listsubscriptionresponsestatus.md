# ListSubscriptionResponseStatus

The subscription's current status is directly related to the status of the underlying customer or mandate that is
enabling the subscription.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ListSubscriptionResponseStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = ListSubscriptionResponseStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `PENDING`   | pending     |
| `ACTIVE`    | active      |
| `CANCELED`  | canceled    |
| `SUSPENDED` | suspended   |
| `COMPLETED` | completed   |