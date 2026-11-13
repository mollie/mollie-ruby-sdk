# BalanceTransfers

## Overview

### Available Operations

* [create](#create) - Create a Connect balance transfer
* [list](#list) - List all Connect balance transfers
* [get](#get) - Get a Connect balance transfer

## create

This API endpoint allows you to create a balance transfer from your organization's balance to a connected organization's balance, or vice versa.
You can also create a balance transfer between two connected organizations.
To create a balance transfer, you must be authenticated as the source organization, and the destination organization must be a connected organization
that has authorized the `balance-transfers.write` scope for your organization.

### Example Usage: create-balance-transfer-200-1

<!-- UsageSnippet language="ruby" operationID="create-connect-balance-transfer" method="post" path="/v2/connect/balance-transfers" example="create-balance-transfer-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.balance_transfers.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::EntityBalanceTransfer.new(
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  source: Models::Components::EntityBalanceTransferParty.new(
    type: Models::Components::BalanceTransferPartyType::ORGANIZATION,
    id: 'org_1234567',
    description: 'Invoice fee'
  ),
  destination: Models::Components::EntityBalanceTransferParty.new(
    type: Models::Components::BalanceTransferPartyType::ORGANIZATION,
    id: 'org_1234567',
    description: 'Invoice fee'
  ),
  description: 'Invoice fee',
  category: Models::Components::BalanceTransferCategory::INVOICE_COLLECTION,
  metadata: {
    'customer_id' => 9876,
    'order_id' => 12_345,
  },
  testmode: false
))

unless res.entity_balance_transfer_response.nil?
  # handle response
end

```
### Example Usage: create-balance-transfer-422-1

<!-- UsageSnippet language="ruby" operationID="create-connect-balance-transfer" method="post" path="/v2/connect/balance-transfers" example="create-balance-transfer-422-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.balance_transfers.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::EntityBalanceTransfer.new(
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  source: Models::Components::EntityBalanceTransferParty.new(
    type: Models::Components::BalanceTransferPartyType::ORGANIZATION,
    id: 'org_1234567',
    description: 'Invoice fee'
  ),
  destination: Models::Components::EntityBalanceTransferParty.new(
    type: Models::Components::BalanceTransferPartyType::ORGANIZATION,
    id: 'org_1234567',
    description: 'Invoice fee'
  ),
  description: 'Invoice fee',
  category: Models::Components::BalanceTransferCategory::INVOICE_COLLECTION,
  metadata: {
    'customer_id' => 9876,
    'order_id' => 12_345,
  },
  testmode: false
))

unless res.entity_balance_transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |
| `body`                                                                                                                                                                                  | [T.nilable(Models::Components::EntityBalanceTransfer)](../../models/shared/entitybalancetransfer.md)                                                                                    | :heavy_minus_sign:                                                                                                                                                                      | N/A                                                                                                                                                                                     |                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::CreateConnectBalanceTransferResponse)](../../models/operations/createconnectbalancetransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Returns a paginated list of balance transfers associated with your organization. These may be a balance transfer that was received or sent from your balance, or a balance transfer that you initiated on behalf of your clients. If no balance transfers are available, the resulting array will be empty. This request should never throw an error.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-connect-balance-transfers" method="get" path="/v2/connect/balance-transfers" example="list-balance-transfer-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListConnectBalanceTransfersRequest.new(
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.balance_transfers.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                               | Type                                                                                                                    | Required                                                                                                                | Description                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                               | [Models::Operations::ListConnectBalanceTransfersRequest](../../models/operations/listconnectbalancetransfersrequest.md) | :heavy_check_mark:                                                                                                      | The request object to use for the request.                                                                              |

### Response

**[T.nilable(Models::Operations::ListConnectBalanceTransfersResponse)](../../models/operations/listconnectbalancetransfersresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single Connect balance transfer object by its ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-connect-balance-transfer" method="get" path="/v2/connect/balance-transfers/{balanceTransferId}" example="get-balance-transfer-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetConnectBalanceTransferRequest.new(
  balance_transfer_id: 'cbtr_j8NvRAM2WNZtsykpLEX8J',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.balance_transfers.get(request: req)

unless res.entity_balance_transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                           | Type                                                                                                                | Required                                                                                                            | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                           | [Models::Operations::GetConnectBalanceTransferRequest](../../models/operations/getconnectbalancetransferrequest.md) | :heavy_check_mark:                                                                                                  | The request object to use for the request.                                                                          |

### Response

**[T.nilable(Models::Operations::GetConnectBalanceTransferResponse)](../../models/operations/getconnectbalancetransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |