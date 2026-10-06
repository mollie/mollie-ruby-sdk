# EntityPairingCodeStatus

The status of the pairing code.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityPairingCodeStatus::ACTIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityPairingCodeStatus.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `ACTIVE`  | active    |
| `EXPIRED` | expired   |
| `REVOKED` | revoked   |