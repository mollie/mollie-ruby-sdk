# Refunds

## Overview

### Available Operations

* [create](#create) - Create payment refund
* [list](#list) - List payment refunds
* [get](#get) - Get payment refund
* [cancel](#cancel) - Cancel payment refund
* [all](#all) - List all refunds

## create

Creates a refund for a specific payment. The refunded amount is credited to your customer usually either via a bank
transfer or by refunding the amount to your customer's credit card.

### Example Usage: create-refund-201-1

<!-- UsageSnippet language="ruby" operationID="create-refund" method="post" path="/v2/payments/{paymentId}/refunds" example="create-refund-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateRefundRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::RefundRequest.new(
    description: 'Refunding a Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    reverse_routing: false,
    routing_reversals: [
      Models::Components::RefundRequestRoutingReversal.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        source: Models::Components::RefundRequestSource.new(
          type: Models::Components::RefundRequestType::ORGANIZATION,
          organization_id: 'org_1234567'
        )
      ),
    ],
    testmode: false
  )
)
res = s.refunds.create(request: req)

unless res.refund_response.nil?
  # handle response
end

```
### Example Usage: create-refund-201-2

<!-- UsageSnippet language="ruby" operationID="create-refund" method="post" path="/v2/payments/{paymentId}/refunds" example="create-refund-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateRefundRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::RefundRequest.new(
    description: 'Refunding a Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    reverse_routing: false,
    routing_reversals: [
      Models::Components::RefundRequestRoutingReversal.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        source: Models::Components::RefundRequestSource.new(
          type: Models::Components::RefundRequestType::ORGANIZATION,
          organization_id: 'org_1234567'
        )
      ),
    ],
    testmode: false
  )
)
res = s.refunds.create(request: req)

unless res.refund_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::CreateRefundRequest](../../models/operations/createrefundrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::CreateRefundResponse)](../../models/operations/createrefundresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 409, 422, 429            | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all refunds created for a specific payment.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-refunds" method="get" path="/v2/payments/{paymentId}/refunds" example="list-refunds-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListRefundsRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  from: 're_5B8cwPMGnU',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.refunds.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::ListRefundsRequest](../../models/operations/listrefundsrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::ListRefundsResponse)](../../models/operations/listrefundsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payment refund by its ID and the ID of its parent payment.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-refund" method="get" path="/v2/payments/{paymentId}/refunds/{refundId}" example="get-refund-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetRefundRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  refund_id: 're_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.refunds.get(request: req)

unless res.refund_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                           | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `request`                                                                           | [Models::Operations::GetRefundRequest](../../models/operations/getrefundrequest.md) | :heavy_check_mark:                                                                  | The request object to use for the request.                                          |

### Response

**[T.nilable(Models::Operations::GetRefundResponse)](../../models/operations/getrefundresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## cancel

Refunds will be executed with a delay of two hours. Until that time, refunds may be canceled manually via the
Mollie Dashboard, or by using this endpoint.

A refund can only be canceled while its `status` field is either `queued` or `pending`. See the
[Get refund endpoint](get-refund) for more information.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="cancel-refund" method="delete" path="/v2/payments/{paymentId}/refunds/{refundId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CancelRefundRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  refund_id: 're_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.refunds.cancel(request: req)

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::CancelRefundRequest](../../models/operations/cancelrefundrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::CancelRefundResponse)](../../models/operations/cancelrefundresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## all

Retrieve a list of all of your refunds.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-all-refunds" method="get" path="/v2/refunds" example="list-refunds-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  profile_id: '<id>',
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListAllRefundsRequest.new(
  from: 're_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.refunds.all(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request`                                                                                     | [Models::Operations::ListAllRefundsRequest](../../models/operations/listallrefundsrequest.md) | :heavy_check_mark:                                                                            | The request object to use for the request.                                                    |

### Response

**[T.nilable(Models::Operations::ListAllRefundsResponse)](../../models/operations/listallrefundsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |