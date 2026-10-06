# CaptureModeResponse

Indicate if the funds should be captured immediately or if you want to [place a hold](https://docs.mollie.com/docs/place-a-hold-for-a-payment#/) 
and capture at a later time.

This field needs to be set to `manual` for method `riverty`.

## Example Usage

```ruby
require "mollie-ruby-sdk"

value = CaptureModeResponse::AUTOMATIC

# Open enum: use .deserialize() to create instances from custom string values
custom = CaptureModeResponse.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `AUTOMATIC` | automatic   |
| `MANUAL`    | manual      |