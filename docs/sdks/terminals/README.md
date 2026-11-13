# Terminals

## Overview

### Available Operations

* [list](#list) - List terminals
* [get](#get) - Get terminal
* [terminals_request_pairing_code](#terminals_request_pairing_code) - Request terminal pairing code
* [terminals_list_pairing_codes](#terminals_list_pairing_codes) - List terminal pairing codes
* [terminals_get_pairing_code](#terminals_get_pairing_code) - Get terminal pairing code
* [terminals_revoke_pairing_code](#terminals_revoke_pairing_code) - Revoke terminal pairing code

## list

Retrieve a list of all physical point-of-sale devices.

The results are paginated.

### Example Usage: list-terminals-200-1

<!-- UsageSnippet language="ruby" operationID="list-terminals" method="get" path="/v2/terminals" example="list-terminals-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListTerminalsRequest.new(
  from: 'term_vytxeTZskVKR7C7WgdSP3d',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.terminals.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-terminals-200-2

<!-- UsageSnippet language="ruby" operationID="list-terminals" method="get" path="/v2/terminals" example="list-terminals-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListTerminalsRequest.new(
  from: 'term_vytxeTZskVKR7C7WgdSP3d',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.terminals.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::ListTerminalsRequest](../../models/operations/listterminalsrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::ListTerminalsResponse)](../../models/operations/listterminalsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single terminal by its ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-terminal" method="get" path="/v2/terminals/{terminalId}" example="get-terminal-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetTerminalRequest.new(
  terminal_id: 'term_vytxeTZskVKR7C7WgdSP3d',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.terminals.get(request: req)

unless res.entity_terminal.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::GetTerminalRequest](../../models/operations/getterminalrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::GetTerminalResponse)](../../models/operations/getterminalresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## terminals_request_pairing_code

> ℹ️ **Test mode**
>
> This endpoint currently does not support test mode yet.

Request a pairing code to onboard a point-of-sale terminal.

The response includes a human-readable `code` for manual entry on the terminal, and a QR Code as a
base64 encoded SVG data URI for scanning if you specify the query parameter `include` with value `details.qrCode`.

Pairing codes expire after 90 days (see `expiresAt`) and can be used multiple times.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="terminals-request-pairing-code" method="post" path="/v2/terminals/pairing-codes" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::TerminalsRequestPairingCodeRequest.new(
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::TerminalsRequestPairingCodeRequestBody.new(
    profile_id: 'pfl_jA9bC4DkFj3G'
  )
)
res = s.terminals.terminals_request_pairing_code(request: req)

unless res.entity_pairing_code.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                               | Type                                                                                                                    | Required                                                                                                                | Description                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                               | [Models::Operations::TerminalsRequestPairingCodeRequest](../../models/operations/terminalsrequestpairingcoderequest.md) | :heavy_check_mark:                                                                                                      | The request object to use for the request.                                                                              |

### Response

**[T.nilable(Models::Operations::TerminalsRequestPairingCodeResponse)](../../models/operations/terminalsrequestpairingcoderesponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 403, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## terminals_list_pairing_codes

> ℹ️ **Test mode**
>
> This endpoint currently does not support test mode yet.

Returns your pairing codes: `active`, `expired`, and `revoked`. Results are paginated.

We keep a pairing code for one month after it is revoked or expires, then delete it. Deleted codes drop out of
this list. Active pairing codes are never deleted.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="terminals-list-pairing-codes" method="get" path="/v2/terminals/pairing-codes" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  profile_id: '<id>',
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::TerminalsListPairingCodesRequest.new(
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.terminals.terminals_list_pairing_codes(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                           | Type                                                                                                                | Required                                                                                                            | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                           | [Models::Operations::TerminalsListPairingCodesRequest](../../models/operations/terminalslistpairingcodesrequest.md) | :heavy_check_mark:                                                                                                  | The request object to use for the request.                                                                          |

### Response

**[T.nilable(Models::Operations::TerminalsListPairingCodesResponse)](../../models/operations/terminalslistpairingcodesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## terminals_get_pairing_code

> ℹ️ **Test mode**
>
> This endpoint currently does not support test mode yet.

Get a pairing code to onboard a point-of-sale terminal.

The response includes a human-readable `code` for manual entry on the terminal and, optionally, a QR Code as a
base64 encoded SVG data URI when you use the `include` query parameter with value `details.qrCode`.

We keep a pairing code for one month after it is revoked or expires, then delete it. Once deleted, this endpoint
returns a 404. Active pairing codes are never deleted.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="terminals-get-pairing-code" method="get" path="/v2/terminals/pairing-codes/{pairingCodeId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::TerminalsGetPairingCodeRequest.new(
  pairing_code_id: 'termpc_R7gX5Ea9bC4DkFj3G',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.terminals.terminals_get_pairing_code(request: req)

unless res.entity_pairing_code.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                       | Type                                                                                                            | Required                                                                                                        | Description                                                                                                     |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                       | [Models::Operations::TerminalsGetPairingCodeRequest](../../models/operations/terminalsgetpairingcoderequest.md) | :heavy_check_mark:                                                                                              | The request object to use for the request.                                                                      |

### Response

**[T.nilable(Models::Operations::TerminalsGetPairingCodeResponse)](../../models/operations/terminalsgetpairingcoderesponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## terminals_revoke_pairing_code

> ℹ️ **Test mode**
>
> This endpoint currently does not support test mode yet.

Revoke a pairing code, preventing the onboarding of new point-of-sale terminals.

Terminals that have already paired with this code are not affected.

We keep a revoked pairing code for one month, then delete it. Once deleted, this endpoint returns a 404.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="terminals-revoke-pairing-code" method="delete" path="/v2/terminals/pairing-codes/{pairingCodeId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.terminals.terminals_revoke_pairing_code(pairing_code_id: 'termpc_R7gX5Ea9bC4DkFj3G', idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z')

unless res.entity_pairing_code.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pairing_code_id`                                                                                                                                                                       | *::String*                                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                                      | Provide the ID of the terminal pairing code.                                                                                                                                            | termpc_R7gX5Ea9bC4DkFj3G                                                                                                                                                                |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |

### Response

**[T.nilable(Models::Operations::TerminalsRevokePairingCodeResponse)](../../models/operations/terminalsrevokepairingcoderesponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |