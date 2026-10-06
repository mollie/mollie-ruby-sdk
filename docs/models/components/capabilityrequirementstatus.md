# CapabilityRequirementStatus

The status of the requirement depends on its due date.
If no due date is given, the status will be `requested`.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = CapabilityRequirementStatus::CURRENTLY_DUE

# Open enum: use .deserialize() to create instances from custom string values
custom = CapabilityRequirementStatus.deserialize("custom_value")
```


## Values

| Name            | Value           |
| --------------- | --------------- |
| `CURRENTLY_DUE` | currently-due   |
| `PAST_DUE`      | past-due        |
| `REQUESTED`     | requested       |