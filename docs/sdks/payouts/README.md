# Payouts

## Overview

### Available Operations

* [create](#create) - Create payout
* [list](#list) - List payouts
* [get](#get) - Get payout
* [cancel](#cancel) - Cancel payout

## create

Request a payout from one of your balances to the balance's configured bank account.

The payout will be executed on the next scheduled business day. If no `amount` is specified, the full available
balance minus any configured balance reserve is paid out.

Once the payout is created with status `requested`, you can cancel it via the
[Cancel payout](cancel-payout) endpoint, up until the payout moves to `initiated`.

Creating a payout via the API automatically sets the balance's `transferFrequency` to `never`,
pausing any previously configured automatic settlement schedule. To resume automatic settlements,
update the transfer frequency via the dashboard.

### Webhooks

Subscribe to the following webhook events to track payout status changes. See the
[Webhook Subscriptions API](list-webhooks) for details on subscribing.

| Event | Description |
|---|---|
| `payout.initiated` | The payout is being executed and funds are reserved. |
| `payout.processing-at-bank` | The payout has been submitted to the bank. |
| `payout.completed` | The payout has been sent to the destination bank account. |
| `payout.canceled` | The payout was canceled via the API before being submitted to the bank. |
| `payout.failed` | The payout failed after creation, including bank rejections and post-submission cancellations. |

### Payout failure reasons

A payout request may fail immediately if one of the following conditions applies:

- A payout is already scheduled for the next business day for this balance.
- The balance has insufficient funds.
- The balance is not active.
- Payouts are blocked for this organization.
- The balance has queued refunds.
- One of the organization's balances is below the negative balance threshold.
- The payout destination (bank account) is invalid or not configured.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-payout" method="post" path="/v2/payouts" example="create-payout-201" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payouts.create(body: Models::Components::PayoutRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'My payout description',
  testmode: false
), idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_payout_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `body`                                                                           | [Models::Components::PayoutRequest](../../models/shared/payoutrequest.md)        | :heavy_check_mark:                                                               | N/A                                                                              |                                                                                  |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::CreatePayoutResponse)](../../models/operations/createpayoutresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all payouts for your organization, including payouts initiated automatically by the
balance's payout schedule and payouts requested via the API or dashboard.

Only payouts created on or after April 1st, 2026 are returned.

The results are paginated. Use the `from` query parameter together with `_links.next` to iterate through
the full result set.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-payouts" method="get" path="/v2/payouts" example="list-payouts-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListPayoutsRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payouts.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::ListPayoutsRequest](../../models/operations/listpayoutsrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::ListPayoutsResponse)](../../models/operations/listpayoutsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payout by its ID.

### Example Usage: get-payout-200-completed

<!-- UsageSnippet language="ruby" operationID="get-payout" method="get" path="/v2/payouts/{payoutId}" example="get-payout-200-completed" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payouts.get(payout_id: 'payout_j8NvRAM2WNZtsykpLEX8J', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_payout_response.nil?
  # handle response
end

```
### Example Usage: get-payout-200-failed

<!-- UsageSnippet language="ruby" operationID="get-payout" method="get" path="/v2/payouts/{payoutId}" example="get-payout-200-failed" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payouts.get(payout_id: 'payout_j8NvRAM2WNZtsykpLEX8J', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_payout_response.nil?
  # handle response
end

```
### Example Usage: get-payout-200-requested

<!-- UsageSnippet language="ruby" operationID="get-payout" method="get" path="/v2/payouts/{payoutId}" example="get-payout-200-requested" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payouts.get(payout_id: 'payout_j8NvRAM2WNZtsykpLEX8J', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_payout_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                                                                                                                     | Required                                                                                                                                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                              | Example                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `payout_id`                                                                                                                                                                                                                                                                                                                                                                              | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the payout.                                                                                                                                                                                                                                                                                                                                                            | payout_j8NvRAM2WNZtsykpLEX8J                                                                                                                                                                                                                                                                                                                                                             |
| `testmode`                                                                                                                                                                                                                                                                                                                                                                               | *T.nilable(T::Boolean)*                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query<br/>parameter must not be sent. For organization-level credentials such as OAuth access tokens, you can enable test mode by<br/>setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                                                                                                                                                                                                                                          |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                        | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                                                                                                                                                                                                                         | 123e4567-e89b-12d3-a456-426                                                                                                                                                                                                                                                                                                                                                              |

### Response

**[T.nilable(Models::Operations::GetPayoutResponse)](../../models/operations/getpayoutresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## cancel

Cancel a payout. A payout can only be canceled while it has the status `requested`. Once the payout moves
to `initiated`, it is too late to cancel.

The canceled payout object is returned with the status set to `canceled`.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="cancel-payout" method="delete" path="/v2/payouts/{payoutId}" example="cancel-payout-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payouts.cancel(payout_id: 'payout_j8NvRAM2WNZtsykpLEX8J', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_payout_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                                                                                                                     | Required                                                                                                                                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                              | Example                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `payout_id`                                                                                                                                                                                                                                                                                                                                                                              | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the payout.                                                                                                                                                                                                                                                                                                                                                            | payout_j8NvRAM2WNZtsykpLEX8J                                                                                                                                                                                                                                                                                                                                                             |
| `testmode`                                                                                                                                                                                                                                                                                                                                                                               | *T.nilable(T::Boolean)*                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query<br/>parameter must not be sent. For organization-level credentials such as OAuth access tokens, you can enable test mode by<br/>setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                                                                                                                                                                                                                                          |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                        | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                                                                                                                                                                                                                         | 123e4567-e89b-12d3-a456-426                                                                                                                                                                                                                                                                                                                                                              |

### Response

**[T.nilable(Models::Operations::CancelPayoutResponse)](../../models/operations/cancelpayoutresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 409, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |