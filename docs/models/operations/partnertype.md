# PartnerType

Indicates the type of partner. Will be `null` if the currently authenticated organization is not
enrolled as a partner.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = PartnerType::OAUTH

# Open enum: use .deserialize() to create instances from custom string values
custom = PartnerType.deserialize("custom_value")
```


## Values

| Name         | Value        |
| ------------ | ------------ |
| `OAUTH`      | oauth        |
| `SIGNUPLINK` | signuplink   |
| `USERAGENT`  | useragent    |