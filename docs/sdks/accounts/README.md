# Accounts

## Overview

### Available Operations

* [create_account](#create_account) - Create business account
* [list_accounts](#list_accounts) - List business accounts
* [get_account](#get_account) - Get business account
* [list](#list) - List transactions
* [get](#get) - Get transaction

## create_account

> 🔒 Restricted access
>
> This API is currently only available to Mollie's authorized partners via OAuth. Direct access for individual businesses isn't available yet, but it's on our roadmap — check back here for updates.

Create a new business account for the authenticated organization.

The response contains the newly created business account.

Each organization can have up to 5 active business accounts. Need more? [Contact us](https://www.mollie.com/contact)
and we'll help you out.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-business-account" method="post" path="/v2/business-accounts/accounts" example="create-business-account-201" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    o_auth: '<YOUR_O_AUTH_HERE>'
  )
)
res = s.accounts.create_account(idempotency_key: '123e4567-e89b-12d3-a456-426614174000', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Operations::CreateBusinessAccountRequestBody.new(
  name: 'Main Checking Account',
  currency: Models::Components::AccountCurrency::EUR,
  testmode: false
))

unless res.business_account_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                                                           | Type                                                                                                                                                                                                                                                                                                                                                                                                                                | Required                                                                                                                                                                                                                                                                                                                                                                                                                            | Description                                                                                                                                                                                                                                                                                                                                                                                                                         | Example                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                                                                   | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                                  | A unique value that identifies this request, so you can safely retry it without creating a second account.<br/>Retrying with the same key within one hour returns the original response. We recommend a UUIDv4.<br/><br/>Keys are tied to the credential that sent the original request, so a refreshed OAuth token won't match<br/>earlier keys. View the [public documentation](https://docs.mollie.com/reference/api-idempotency) to learn<br/>more. | 123e4567-e89b-12d3-a456-426614174000                                                                                                                                                                                                                                                                                                                                                                                                |
| `x_client_signature`                                                                                                                                                                                                                                                                                                                                                                                                                | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                                  | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.                                                                                                                                                                                                                                                    | MEUCIQDx8sJvK3z...                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `x_client_signed_at`                                                                                                                                                                                                                                                                                                                                                                                                                | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                                  | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration.                                                                                                                                                                                                                                             | 2025-01-01T12:00:00Z                                                                                                                                                                                                                                                                                                                                                                                                                |
| `body`                                                                                                                                                                                                                                                                                                                                                                                                                              | [T.nilable(Models::Operations::CreateBusinessAccountRequestBody)](../../models/operations/createbusinessaccountrequestbody.md)                                                                                                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                                                                  | N/A                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                     |

### Response

**[T.nilable(Models::Operations::CreateBusinessAccountResponse)](../../models/operations/createbusinessaccountresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 409, 422, 429            | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_accounts

> 🔒 Restricted access
>
> This API is currently only available to Mollie's authorized partners via OAuth. Direct access for individual businesses isn't available yet, but it's on our roadmap — check back here for updates.

Retrieve all business accounts for the authenticated organization.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-business-accounts" method="get" path="/v2/business-accounts/accounts" example="list-business-accounts-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    o_auth: '<YOUR_O_AUTH_HERE>'
  )
)

req = Models::Operations::ListBusinessAccountsRequest.new(
  iban: 'NL95MLLE1234567890',
  from: 'ba_nopqrstuvwxyz23456789A',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.accounts.list_accounts(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                 | [Models::Operations::ListBusinessAccountsRequest](../../models/operations/listbusinessaccountsrequest.md) | :heavy_check_mark:                                                                                        | The request object to use for the request.                                                                |

### Response

**[T.nilable(Models::Operations::ListBusinessAccountsResponse)](../../models/operations/listbusinessaccountsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get_account

> 🔒 Restricted access
>
> This API is currently only available to Mollie's authorized partners via OAuth. Direct access for individual businesses isn't available yet, but it's on our roadmap — check back here for updates.

Retrieve a single business account object by its account ID. This allows you to check the current status,
balance, and account details.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-business-account" method="get" path="/v2/business-accounts/accounts/{businessAccountId}" example="get-business-account-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    o_auth: '<YOUR_O_AUTH_HERE>'
  )
)

req = Models::Operations::GetBusinessAccountRequest.new(
  business_account_id: 'ba_nopqrstuvwxyz23456789A',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.accounts.get_account(request: req)

unless res.business_account_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::GetBusinessAccountRequest](../../models/operations/getbusinessaccountrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::GetBusinessAccountResponse)](../../models/operations/getbusinessaccountresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

> 🔒 Restricted access
>
> This API is currently only available to Mollie's authorized partners via OAuth. Direct access for individual businesses isn't available yet, but it's on our roadmap — check back here for updates.

Retrieve all transactions for a specific business account.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-business-account-transactions" method="get" path="/v2/business-accounts/accounts/{businessAccountId}/transactions" example="list-transactions-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    o_auth: '<YOUR_O_AUTH_HERE>'
  )
)

req = Models::Operations::ListBusinessAccountTransactionsRequest.new(
  business_account_id: 'ba_nopqrstuvwxyz23456789A',
  credit_debit_indicator: Models::Components::CreditDebitIndicator::DEBIT,
  processed_after: DateTime.iso8601('2025-02-01T00:00:00+00:00'),
  processed_before: DateTime.iso8601('2025-02-26T23:59:59+00:00'),
  from: 'batr_87GByBuj4UCcUTEbs6aGJ',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.accounts.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                       | Type                                                                                                                            | Required                                                                                                                        | Description                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                       | [Models::Operations::ListBusinessAccountTransactionsRequest](../../models/operations/listbusinessaccounttransactionsrequest.md) | :heavy_check_mark:                                                                                                              | The request object to use for the request.                                                                                      |

### Response

**[T.nilable(Models::Operations::ListBusinessAccountTransactionsResponse)](../../models/operations/listbusinessaccounttransactionsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

> 🔒 Restricted access
>
> This API is currently only available to Mollie's authorized partners via OAuth. Direct access for individual businesses isn't available yet, but it's on our roadmap — check back here for updates.

Retrieve a single transaction object by its transaction ID. This allows you to check the details,
amount, counterparty, and balance impact of a specific transaction.

### Example Usage: get-transaction-200

<!-- UsageSnippet language="ruby" operationID="get-business-account-transaction" method="get" path="/v2/business-accounts/accounts/{businessAccountId}/transactions/{transactionId}" example="get-transaction-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    o_auth: '<YOUR_O_AUTH_HERE>'
  )
)

req = Models::Operations::GetBusinessAccountTransactionRequest.new(
  business_account_id: 'ba_nopqrstuvwxyz23456789A',
  transaction_id: 'batr_87GByBuj4UCcUTEbs6aGJ',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.accounts.get(request: req)

unless res.transaction_response.nil?
  # handle response
end

```
### Example Usage: get-transaction-200-credit

<!-- UsageSnippet language="ruby" operationID="get-business-account-transaction" method="get" path="/v2/business-accounts/accounts/{businessAccountId}/transactions/{transactionId}" example="get-transaction-200-credit" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    o_auth: '<YOUR_O_AUTH_HERE>'
  )
)

req = Models::Operations::GetBusinessAccountTransactionRequest.new(
  business_account_id: 'ba_nopqrstuvwxyz23456789A',
  transaction_id: 'batr_87GByBuj4UCcUTEbs6aGJ',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.accounts.get(request: req)

unless res.transaction_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                   | Type                                                                                                                        | Required                                                                                                                    | Description                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                   | [Models::Operations::GetBusinessAccountTransactionRequest](../../models/operations/getbusinessaccounttransactionrequest.md) | :heavy_check_mark:                                                                                                          | The request object to use for the request.                                                                                  |

### Response

**[T.nilable(Models::Operations::GetBusinessAccountTransactionResponse)](../../models/operations/getbusinessaccounttransactionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |