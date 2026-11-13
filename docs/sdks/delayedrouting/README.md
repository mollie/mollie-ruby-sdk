# DelayedRouting

## Overview

### Available Operations

* [create](#create) - Create a delayed route
* [list](#list) - List payment routes
* [get](#get) - Get a delayed route

## create

Create a route for a specific payment.
The routed amount is credited to the account of your customer.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="payment-create-route" method="post" path="/v2/payments/{paymentId}/routes" example="create-route-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::PaymentCreateRouteRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::RouteCreateRequest.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    destination: Models::Components::RouteCreateRequestDestination.new(
      type: Models::Components::RouteDestinationType::ORGANIZATION,
      organization_id: 'org_1234567'
    ),
    description: 'Payment for Order #12345'
  )
)
res = s.delayed_routing.create(request: req)

unless res.route_create_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::PaymentCreateRouteRequest](../../models/operations/paymentcreaterouterequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::PaymentCreateRouteResponse)](../../models/operations/paymentcreaterouteresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all routes created for a specific payment.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="payment-list-routes" method="get" path="/v2/payments/{paymentId}/routes" example="list-routes-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::PaymentListRoutesRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.delayed_routing.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::PaymentListRoutesRequest](../../models/operations/paymentlistroutesrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::PaymentListRoutesResponse)](../../models/operations/paymentlistroutesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single route created for a specific payment.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="payment-get-route" method="get" path="/v2/payments/{paymentId}/routes/{routeId}" example="get-route-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::PaymentGetRouteRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  route_id: 'crt_dyARQ3JzCgtPDhU2Pbq3J',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.delayed_routing.get(request: req)

unless res.route_get_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::PaymentGetRouteRequest](../../models/operations/paymentgetrouterequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::PaymentGetRouteResponse)](../../models/operations/paymentgetrouteresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |