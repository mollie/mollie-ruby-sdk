# AccountStatus

The status of the business account.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = AccountStatus::ACTIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = AccountStatus.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `ACTIVE`  | active    |
| `BLOCKED` | blocked   |
| `CLOSED`  | closed    |