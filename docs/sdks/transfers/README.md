# Transfers

## Overview

### Available Operations

* [create](#create) - Create transfer
* [get](#get) - Get transfer

## create

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Create a SEPA Credit Transfer from your Mollie Business Account.

To initiate a transfer, you must provide the transfer scheme, the amount, the debtor IBAN (your Mollie Business
Account IBAN), and the creditor (recipient) details.

Each request must include an `Idempotency-Key` header to prevent duplicate transfers, and must be signed using the
`X-Client-Signature` and `X-Client-Signed-At` headers.

### Simulating transfer scenarios in test mode

In test mode, you can simulate various transfer scenarios by adjusting the transfer amount. This allows you to
mimic the typical status progression of a real-world transfer. Note that a transfer's progression will stop once
it reaches a final status: `blocked`, `failed`, `processed`, or `returned`.

| Amount  | Scenario                                            | Webhook sequence                                                                                                                                                   |
|---------|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `11.00` | Transfer initiated, pending review by Mollie        | `business-account-transfer.requested` → `business-account-transfer.initiated` → `business-account-transfer.pending-review`                                         |
| `12.00` | Transfer initiated, blocked by Mollie               | `business-account-transfer.requested` → `business-account-transfer.initiated` → `business-account-transfer.pending-review` → `business-account-transfer.blocked`   |
| `13.00` | Transfer initiated, failed on scheme submission     | `business-account-transfer.requested` → `business-account-transfer.initiated` → `business-account-transfer.failed`                                                 |
| `14.00` | Transfer processed, then returned by receiving bank | `business-account-transfer.requested` → `business-account-transfer.initiated` → `business-account-transfer.processed` → `business-account-transfer.returned`       |
| Other   | Default: transfer is processed                      | `business-account-transfer.requested` → `business-account-transfer.initiated` → `business-account-transfer.processed`                                              |

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-transfer" method="post" path="/v2/business-accounts/transfers" example="create-transfer-201" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.transfers.create(x_client_signature: '<value>', x_client_signed_at: '2025-01-01T12:00:00Z', idempotency_key: '12345678-abcd', body: Models::Components::TransferRequest.new(
  debtor_iban: 'NL55MLLE0123456789',
  creditor: Models::Components::TransferParty.new(
    full_name: 'Jan Jansen',
    account: Models::Components::TransferPartyAccount.new(
      iban: 'NL02ABNA0123456789'
    )
  ),
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'Invoice 12345',
  transfer_scheme: Models::Components::TransferScheme.new(
    type: Models::Components::TransferSchemeType::SEPA_CREDIT_INST
  ),
  testmode: false
))

unless res.transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                       | Type                                                                                                                                                                                                                                                                                                                                                                                            | Required                                                                                                                                                                                                                                                                                                                                                                                        | Description                                                                                                                                                                                                                                                                                                                                                                                     | Example                                                                                                                                                                                                                                                                                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `x_client_signature`                                                                                                                                                                                                                                                                                                                                                                            | *::String*                                                                                                                                                                                                                                                                                                                                                                                      | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                              | A cryptographic signature of the request payload, used to verify the authenticity of the transfer request.                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                                                 |
| `x_client_signed_at`                                                                                                                                                                                                                                                                                                                                                                            | *::String*                                                                                                                                                                                                                                                                                                                                                                                      | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                              | The timestamp (in ISO 8601 format) indicating when the client signed the request. Used in conjunction with<br/>`X-Client-Signature` for request verification.                                                                                                                                                                                                                                   | 2025-01-01T12:00:00Z                                                                                                                                                                                                                                                                                                                                                                            |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                               | *::String*                                                                                                                                                                                                                                                                                                                                                                                      | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                              | A unique value used to identify this request and prevent duplicate transfers. UUIDv4 is recommended to<br/>guarantee uniqueness across multiple processes or servers. If two requests are received with the same<br/>idempotency key, the second request will be discarded.<br/><br/>View the [public documentation](https://docs.mollie.com/reference/api-idempotency#using-an-idempotency-key)<br/>to learn more. | 12345678-abcd                                                                                                                                                                                                                                                                                                                                                                                   |
| `body`                                                                                                                                                                                                                                                                                                                                                                                          | [T.nilable(Models::Components::TransferRequest)](../../models/shared/transferrequest.md)                                                                                                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                              | N/A                                                                                                                                                                                                                                                                                                                                                                                             |                                                                                                                                                                                                                                                                                                                                                                                                 |

### Response

**[T.nilable(Models::Operations::CreateTransferResponse)](../../models/operations/createtransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Models::Errors::ErrorResponse | 503                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Retrieve a single transfer object by its transfer ID. This allows you to check the current status
and details of a previously created transfer.

### Example Usage: get-transfer-200

<!-- UsageSnippet language="ruby" operationID="get-transfer" method="get" path="/v2/business-accounts/transfers/{businessAccountsTransferId}" example="get-transfer-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetTransferRequest.new(
  business_accounts_transfer_id: 'batrf_87GByBuj4UCcUTEbs6aGJ',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.transfers.get(request: req)

unless res.transfer_response.nil?
  # handle response
end

```
### Example Usage: processed-transfer

<!-- UsageSnippet language="ruby" operationID="get-transfer" method="get" path="/v2/business-accounts/transfers/{businessAccountsTransferId}" example="processed-transfer" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetTransferRequest.new(
  business_accounts_transfer_id: 'batrf_87GByBuj4UCcUTEbs6aGJ',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.transfers.get(request: req)

unless res.transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::GetTransferRequest](../../models/operations/gettransferrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::GetTransferResponse)](../../models/operations/gettransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |