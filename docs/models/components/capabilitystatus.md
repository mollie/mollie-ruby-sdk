# CapabilityStatus

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = CapabilityStatus::UNREQUESTED

# Open enum: use .deserialize() to create instances from custom string values
custom = CapabilityStatus.deserialize("custom_value")
```


## Values

| Name          | Value         |
| ------------- | ------------- |
| `UNREQUESTED` | unrequested   |
| `ENABLED`     | enabled       |
| `DISABLED`    | disabled      |
| `PENDING`     | pending       |