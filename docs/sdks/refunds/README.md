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
res = s.refunds.create(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::RefundRequest.new(
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
))

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
res = s.refunds.create(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::RefundRequest.new(
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
))

unless res.refund_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                            | Type                                                                                 | Required                                                                             | Description                                                                          | Example                                                                              |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| `payment_id`                                                                         | *::String*                                                                           | :heavy_check_mark:                                                                   | Provide the ID of the related payment.                                               | tr_5B8cwPMGnU                                                                        |
| `idempotency_key`                                                                    | *T.nilable(::String)*                                                                | :heavy_minus_sign:                                                                   | A unique key to ensure idempotent requests. This key should be a UUID v4 string.     | 123e4567-e89b-12d3-a456-426                                                          |
| `body`                                                                               | [T.nilable(Models::Components::RefundRequest)](../../models/shared/refundrequest.md) | :heavy_minus_sign:                                                                   | N/A                                                                                  |                                                                                      |

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
  idempotency_key: '123e4567-e89b-12d3-a456-426'
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
  idempotency_key: '123e4567-e89b-12d3-a456-426'
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
res = s.refunds.cancel(payment_id: 'tr_5B8cwPMGnU', refund_id: 're_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426')

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                                                                                                                     | Required                                                                                                                                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                              | Example                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `payment_id`                                                                                                                                                                                                                                                                                                                                                                             | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the related payment.                                                                                                                                                                                                                                                                                                                                                   | tr_5B8cwPMGnU                                                                                                                                                                                                                                                                                                                                                                            |
| `refund_id`                                                                                                                                                                                                                                                                                                                                                                              | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the related refund.                                                                                                                                                                                                                                                                                                                                                    | re_5B8cwPMGnU                                                                                                                                                                                                                                                                                                                                                                            |
| `testmode`                                                                                                                                                                                                                                                                                                                                                                               | *T.nilable(T::Boolean)*                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query<br/>parameter must not be sent. For organization-level credentials such as OAuth access tokens, you can enable test mode by<br/>setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                                                                                                                                                                                                                                          |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                        | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                                                                                                                                                                                                                         | 123e4567-e89b-12d3-a456-426                                                                                                                                                                                                                                                                                                                                                              |

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
  idempotency_key: '123e4567-e89b-12d3-a456-426'
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