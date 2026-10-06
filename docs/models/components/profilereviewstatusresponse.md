# ProfileReviewStatusResponse

The status of the requested changes.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = ProfileReviewStatusResponse::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = ProfileReviewStatusResponse.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `PENDING`  | pending    |
| `REJECTED` | rejected   |