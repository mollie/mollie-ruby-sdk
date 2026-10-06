# CapabilityStatusReason

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = CapabilityStatusReason::REQUIREMENT_PAST_DUE

# Open enum: use .deserialize() to create instances from custom string values
custom = CapabilityStatusReason.deserialize("custom_value")
```


## Values

| Name                            | Value                           |
| ------------------------------- | ------------------------------- |
| `REQUIREMENT_PAST_DUE`          | requirement-past-due            |
| `ONBOARDING_INFORMATION_NEEDED` | onboarding-information-needed   |