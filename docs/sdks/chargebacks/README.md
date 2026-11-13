# Chargebacks

## Overview

### Available Operations

* [list](#list) - List payment chargebacks
* [get](#get) - Get payment chargeback
* [all](#all) - List all chargebacks

## list

Retrieve the chargebacks initiated for a specific payment.

The results are paginated.

### Example Usage: list-chargeback-200-1

<!-- UsageSnippet language="ruby" operationID="list-chargebacks" method="get" path="/v2/payments/{paymentId}/chargebacks" example="list-chargeback-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListChargebacksRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  from: 'chb_xFzwUN4ci8HAmSGUACS4J',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-chargeback-200-2

<!-- UsageSnippet language="ruby" operationID="list-chargebacks" method="get" path="/v2/payments/{paymentId}/chargebacks" example="list-chargeback-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListChargebacksRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  from: 'chb_xFzwUN4ci8HAmSGUACS4J',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-chargeback-200-3

<!-- UsageSnippet language="ruby" operationID="list-chargebacks" method="get" path="/v2/payments/{paymentId}/chargebacks" example="list-chargeback-200-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListChargebacksRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  from: 'chb_xFzwUN4ci8HAmSGUACS4J',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::ListChargebacksRequest](../../models/operations/listchargebacksrequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::ListChargebacksResponse)](../../models/operations/listchargebacksresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payment chargeback by its ID and the ID of its parent payment.

### Example Usage: get-chargeback-200-1

<!-- UsageSnippet language="ruby" operationID="get-chargeback" method="get" path="/v2/payments/{paymentId}/chargebacks/{chargebackId}" example="get-chargeback-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetChargebackRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  chargeback_id: 'chb_xFzwUN4ci8HAmSGUACS4J',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.get(request: req)

unless res.entity_chargeback.nil?
  # handle response
end

```
### Example Usage: get-chargeback-200-2

<!-- UsageSnippet language="ruby" operationID="get-chargeback" method="get" path="/v2/payments/{paymentId}/chargebacks/{chargebackId}" example="get-chargeback-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetChargebackRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  chargeback_id: 'chb_xFzwUN4ci8HAmSGUACS4J',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.get(request: req)

unless res.entity_chargeback.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::GetChargebackRequest](../../models/operations/getchargebackrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::GetChargebackResponse)](../../models/operations/getchargebackresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## all

Retrieve all chargebacks initiated for all your payments.

The results are paginated.

### Example Usage: list-all-chargebacks-200-1

<!-- UsageSnippet language="ruby" operationID="list-all-chargebacks" method="get" path="/v2/chargebacks" example="list-all-chargebacks-200-1" -->
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

req = Models::Operations::ListAllChargebacksRequest.new(
  from: 'chb_xFzwUN4ci8HAmSGUACS4J',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.all(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-all-chargebacks-200-2

<!-- UsageSnippet language="ruby" operationID="list-all-chargebacks" method="get" path="/v2/chargebacks" example="list-all-chargebacks-200-2" -->
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

req = Models::Operations::ListAllChargebacksRequest.new(
  from: 'chb_xFzwUN4ci8HAmSGUACS4J',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.all(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-all-chargebacks-200-3

<!-- UsageSnippet language="ruby" operationID="list-all-chargebacks" method="get" path="/v2/chargebacks" example="list-all-chargebacks-200-3" -->
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

req = Models::Operations::ListAllChargebacksRequest.new(
  from: 'chb_xFzwUN4ci8HAmSGUACS4J',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.chargebacks.all(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::ListAllChargebacksRequest](../../models/operations/listallchargebacksrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::ListAllChargebacksResponse)](../../models/operations/listallchargebacksresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |