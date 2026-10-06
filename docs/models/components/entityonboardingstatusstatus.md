# EntityOnboardingStatusStatus

The current status of the organization's onboarding process.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = EntityOnboardingStatusStatus::NEEDS_DATA

# Open enum: use .deserialize() to create instances from custom string values
custom = EntityOnboardingStatusStatus.deserialize("custom_value")
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `NEEDS_DATA` | needs-data   |
| `IN_REVIEW`  | in-review    |
| `COMPLETED`  | completed    |