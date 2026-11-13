# Permissions

## Overview

### Available Operations

* [list](#list) - List permissions
* [get](#get) - Get permission

## list

Retrieve a list of all permissions available to the current access token.

The results are **not** paginated.

### Example Usage: list-permissions-200-1

<!-- UsageSnippet language="ruby" operationID="list-permissions" method="get" path="/v2/permissions" example="list-permissions-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.permissions.list(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z')

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-permissions-200-2

<!-- UsageSnippet language="ruby" operationID="list-permissions" method="get" path="/v2/permissions" example="list-permissions-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.permissions.list(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |

### Response

**[T.nilable(Models::Operations::ListPermissionsResponse)](../../models/operations/listpermissionsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single permission by its ID, and see if the permission is granted to the current access token.

### Example Usage: get-permission-200-1

<!-- UsageSnippet language="ruby" operationID="get-permission" method="get" path="/v2/permissions/{permissionId}" example="get-permission-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPermissionRequest.new(
  permission_id: 'payments.read',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.permissions.get(request: req)

unless res.entity_permission.nil?
  # handle response
end

```
### Example Usage: get-permission-200-2

<!-- UsageSnippet language="ruby" operationID="get-permission" method="get" path="/v2/permissions/{permissionId}" example="get-permission-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPermissionRequest.new(
  permission_id: 'payments.read',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.permissions.get(request: req)

unless res.entity_permission.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::GetPermissionRequest](../../models/operations/getpermissionrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::GetPermissionResponse)](../../models/operations/getpermissionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |