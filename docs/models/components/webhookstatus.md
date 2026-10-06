# WebhookStatus

The subscription's current status.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = WebhookStatus::ENABLED

# Open enum: use .deserialize() to create instances from custom string values
custom = WebhookStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `ENABLED`  | enabled    |
| `BLOCKED`  | blocked    |
| `DISABLED` | disabled   |
| `DELETED`  | deleted    |