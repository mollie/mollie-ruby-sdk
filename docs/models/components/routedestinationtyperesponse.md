# RouteDestinationTypeResponse

The type of destination. Currently only the destination type `organization` is supported.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = RouteDestinationTypeResponse::ORGANIZATION

# Open enum: use .deserialize() to create instances from custom string values
custom = RouteDestinationTypeResponse.deserialize("custom_value")
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `ORGANIZATION` | organization   |