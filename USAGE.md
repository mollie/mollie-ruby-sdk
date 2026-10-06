<!-- Start SDK Example Usage [usage] -->
```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new
res = s.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: "",
    password: ""
  ),
  idempotency_key: "123e4567-e89b-12d3-a456-426",
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    refresh_token: "refresh_...",
    redirect_uri: "https://example.com/redirect"
  )
)

unless res.object.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->