# MandateScopes

An array defining the eligible use cases for the mandate. For creditcard mandates, this field will always be 
present and can contain one or both of the following values:

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = MandateScopes::CUSTOMER_PRESENT
```


## Values

| Name                   | Value                  |
| ---------------------- | ---------------------- |
| `CUSTOMER_PRESENT`     | customer-present       |
| `CUSTOMER_NOT_PRESENT` | customer-not-present   |