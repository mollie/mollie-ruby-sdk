# Action

The action performed on the unmatched credit transfer.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = Action::MATCH

# Open enum: use .deserialize() to create instances from custom string values
custom = Action.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `MATCH`  | match    |
| `RETURN` | return   |