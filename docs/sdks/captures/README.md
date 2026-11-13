# Captures

## Overview

### Available Operations

* [create](#create) - Create capture
* [list](#list) - List captures
* [get](#get) - Get capture

## create

Capture an *authorized* payment.

Some payment methods allow you to first collect a customer's authorization,
and capture the amount at a later point.

By default, Mollie captures payments automatically. If however you
configured your payment with `captureMode: manual`, you can capture the payment using this endpoint after
having collected the customer's authorization.

### Example Usage: get-capture-200-1

<!-- UsageSnippet language="ruby" operationID="create-capture" method="post" path="/v2/payments/{paymentId}/captures" example="get-capture-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCaptureRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::EntityCapture.new(
    description: 'Capture for cart #12345',
    amount: Models::Components::AmountNullable.new(
      currency: 'EUR',
      value: '10.00'
    ),
    testmode: false
  )
)
res = s.captures.create(request: req)

unless res.capture_response.nil?
  # handle response
end

```
### Example Usage: get-capture-200-2

<!-- UsageSnippet language="ruby" operationID="create-capture" method="post" path="/v2/payments/{paymentId}/captures" example="get-capture-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCaptureRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::EntityCapture.new(
    description: 'Capture for cart #12345',
    amount: Models::Components::AmountNullable.new(
      currency: 'EUR',
      value: '10.00'
    ),
    testmode: false
  )
)
res = s.captures.create(request: req)

unless res.capture_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::CreateCaptureRequest](../../models/operations/createcapturerequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::CreateCaptureResponse)](../../models/operations/createcaptureresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all captures created for a specific payment.

The results are paginated.

### Example Usage: list-captures-200-1

<!-- UsageSnippet language="ruby" operationID="list-captures" method="get" path="/v2/payments/{paymentId}/captures" example="list-captures-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListCapturesRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  from: 'cpt_vytxeTZskVKR7C7WgdSP3d',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.captures.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-captures-200-2

<!-- UsageSnippet language="ruby" operationID="list-captures" method="get" path="/v2/payments/{paymentId}/captures" example="list-captures-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListCapturesRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  from: 'cpt_vytxeTZskVKR7C7WgdSP3d',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.captures.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::ListCapturesRequest](../../models/operations/listcapturesrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::ListCapturesResponse)](../../models/operations/listcapturesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payment capture by its ID and the ID of its parent
payment.

### Example Usage: get-capture-200-1

<!-- UsageSnippet language="ruby" operationID="get-capture" method="get" path="/v2/payments/{paymentId}/captures/{captureId}" example="get-capture-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetCaptureRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  capture_id: 'cpt_vytxeTZskVKR7C7WgdSP3d',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.captures.get(request: req)

unless res.capture_response.nil?
  # handle response
end

```
### Example Usage: get-capture-200-2

<!-- UsageSnippet language="ruby" operationID="get-capture" method="get" path="/v2/payments/{paymentId}/captures/{captureId}" example="get-capture-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetCaptureRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  capture_id: 'cpt_vytxeTZskVKR7C7WgdSP3d',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.captures.get(request: req)

unless res.capture_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                             | Type                                                                                  | Required                                                                              | Description                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `request`                                                                             | [Models::Operations::GetCaptureRequest](../../models/operations/getcapturerequest.md) | :heavy_check_mark:                                                                    | The request object to use for the request.                                            |

### Response

**[T.nilable(Models::Operations::GetCaptureResponse)](../../models/operations/getcaptureresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |