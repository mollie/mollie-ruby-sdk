# Oauth

## Overview

### Available Operations

* [generate](#generate) - Generate tokens
* [revoke](#revoke) - Revoke tokens

## generate

Exchange the authorization code you received from the [Authorize endpoint](oauth-authorize) for an 'access token'
API credential, with which you can communicate with the Mollie API on behalf of the consenting merchant.

This endpoint can only be accessed using **OAuth client credentials**.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="oauth-generate-tokens" method="post" path="/oauth2/tokens" example="oauth-generate-tokens" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new
res = s.oauth.generate(security: Models::Operations::OauthGenerateTokensSecurity.new(
  username: '',
  password: ''
), idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::OauthGenerateTokensRequestBody.new(
  grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
  code: 'auth_...',
  refresh_token: 'refresh_...',
  redirect_uri: 'https://example.com/redirect'
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                  | Type                                                                                                                       | Required                                                                                                                   | Description                                                                                                                | Example                                                                                                                    |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                 | [Models::Operations::OauthGenerateTokensSecurity](../../models/operations/oauthgeneratetokenssecurity.md)                  | :heavy_check_mark:                                                                                                         | The security requirements to use for the request.                                                                          |                                                                                                                            |
| `idempotency_key`                                                                                                          | *T.nilable(::String)*                                                                                                      | :heavy_minus_sign:                                                                                                         | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                           | 123e4567-e89b-12d3-a456-426                                                                                                |
| `body`                                                                                                                     | [T.nilable(Models::Operations::OauthGenerateTokensRequestBody)](../../models/operations/oauthgeneratetokensrequestbody.md) | :heavy_minus_sign:                                                                                                         | N/A                                                                                                                        |                                                                                                                            |

### Response

**[T.nilable(Models::Operations::OauthGenerateTokensResponse)](../../models/operations/oauthgeneratetokensresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 429                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## revoke

Revoke an access token or refresh token. Once revoked, the token can no longer be used.

Revoking a refresh token revokes all access tokens that were created using the same authorization.

This endpoint can only be accessed using **OAuth client credentials**.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="oauth-revoke-tokens" method="delete" path="/oauth2/tokens" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new
res = s.oauth.revoke(security: Models::Operations::OauthRevokeTokensSecurity.new(
  username: '',
  password: ''
), idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::OauthRevokeTokensRequestBody.new(
  token_type_hint: Models::Components::OauthTokenTypeHint::ACCESS_TOKEN,
  token: 'access_...'
))

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                                              | Type                                                                                                                   | Required                                                                                                               | Description                                                                                                            | Example                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                             | [Models::Operations::OauthRevokeTokensSecurity](../../models/operations/oauthrevoketokenssecurity.md)                  | :heavy_check_mark:                                                                                                     | The security requirements to use for the request.                                                                      |                                                                                                                        |
| `idempotency_key`                                                                                                      | *T.nilable(::String)*                                                                                                  | :heavy_minus_sign:                                                                                                     | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                       | 123e4567-e89b-12d3-a456-426                                                                                            |
| `body`                                                                                                                 | [T.nilable(Models::Operations::OauthRevokeTokensRequestBody)](../../models/operations/oauthrevoketokensrequestbody.md) | :heavy_minus_sign:                                                                                                     | N/A                                                                                                                    |                                                                                                                        |

### Response

**[T.nilable(Models::Operations::OauthRevokeTokensResponse)](../../models/operations/oauthrevoketokensresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 429                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |