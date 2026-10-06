# TerminalModel

The model of the terminal. For example for a PAX A920, this field's value will be `A920`.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = TerminalModel::A35

# Open enum: use .deserialize() to create instances from custom string values
custom = TerminalModel.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `A35`      | A35        |
| `A77`      | A77        |
| `A920`     | A920       |
| `A920_PRO` | A920Pro    |
| `IM30`     | IM30       |
| `TAP`      | Tap        |