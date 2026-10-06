# DraftTransfers

## Overview

### Available Operations

* [create](#create) - Create draft transfer
* [list](#list) - List draft transfers
* [get](#get) - Get draft transfer
* [cancel](#cancel) - Cancel draft transfer

## create

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Creates a draft transfer. The draft transfer immediately enters `pending-review` and appears in the
initiator's queue in Mollie Apps. It carries no legal weight and moves no funds until a human initiator
approves it there.

### Test mode

Creating a draft transfer always returns a synthetic draft in `pending-review` status, using synthetic data,
same as in live mode. No real funds move and nothing is sent to Mollie Apps.

Editing a draft transfer after creation is not supported via the API. Instead, depending on the amount, you
can simulate different outcomes for the initiator's decision at creation time:

| Amount  | Simulated outcome                                    | Webhook sequence                                                                                  |
|---------|-------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| `13.00` | Declined by the initiator, with a free-text reason     | `business-account-draft-transfer.created` → `business-account-draft-transfer.declined`             |
| `14.00` | Approved                                               | `business-account-draft-transfer.created` → `business-account-draft-transfer.approved`             |
| Other   | Default behavior (pending review)                      | `business-account-draft-transfer.created`                                                          |

The webhooks fire asynchronously, with a short delay between them to mimic real timing. [Get](get-draft-transfer)
and [list](list-draft-transfers) reflect the simulated outcome once it lands.

Cancelling (via `DELETE`) is unaffected by the amount: it always transitions the draft to `declined` with
`statusReason.code` set to `deleted-by-creator`, the same as in live mode.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-draft-transfer" method="post" path="/v2/business-accounts/draft-transfers" example="create-draft-transfer-201" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.draft_transfers.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::CreateDraftTransferRequest.new(
  debtor_iban: 'NL55MLLE0123456789',
  creditor: Models::Components::DraftTransferParty.new(
    full_name: 'Jan Jansen',
    account: Models::Components::DraftTransferPartyAccount.new(
      iban: 'NL02ABNA0123456789'
    )
  ),
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'Invoice 12345',
  scheduled_execution_date: Date.parse('2025-03-01'),
  testmode: false
))

unless res.draft_transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Components::CreateDraftTransferRequest)](../../models/shared/createdrafttransferrequest.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::CreateDraftTransferResponse)](../../models/operations/createdrafttransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Retrieves a list of draft transfers created via this API for the organization.

The results are paginated.

In test mode, this returns synthetic draft transfers only, not your real data.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-draft-transfers" method="get" path="/v2/business-accounts/draft-transfers" example="list-draft-transfers-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListDraftTransfersRequest.new(
  limit: 50,
  status: Models::Components::DraftTransferStatus::PENDING_REVIEW,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.draft_transfers.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::ListDraftTransfersRequest](../../models/operations/listdrafttransfersrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::ListDraftTransfersResponse)](../../models/operations/listdrafttransfersresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Retrieves a single draft transfer by its identifier.

Only draft transfers created via this API are visible via this endpoint. Draft transfers created in Mollie
Apps return a `404`, even though they appear in the [list endpoint](list-draft-transfers).

In test mode, this returns synthetic data only, not your real draft transfer. See [Create draft
transfer](create-draft-transfer) for how to simulate `approved` and `declined` outcomes.

### Example Usage: approved-draft-transfer

<!-- UsageSnippet language="ruby" operationID="get-draft-transfer" method="get" path="/v2/business-accounts/draft-transfers/{draftTransferId}" example="approved-draft-transfer" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.draft_transfers.get(draft_transfer_id: 'badrt_87GByBuj4UCcUTEbs6aGJ', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.draft_transfer_response.nil?
  # handle response
end

```
### Example Usage: declined-by-initiator-draft-transfer

<!-- UsageSnippet language="ruby" operationID="get-draft-transfer" method="get" path="/v2/business-accounts/draft-transfers/{draftTransferId}" example="declined-by-initiator-draft-transfer" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.draft_transfers.get(draft_transfer_id: 'badrt_87GByBuj4UCcUTEbs6aGJ', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.draft_transfer_response.nil?
  # handle response
end

```
### Example Usage: get-draft-transfer-200

<!-- UsageSnippet language="ruby" operationID="get-draft-transfer" method="get" path="/v2/business-accounts/draft-transfers/{draftTransferId}" example="get-draft-transfer-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.draft_transfers.get(draft_transfer_id: 'badrt_87GByBuj4UCcUTEbs6aGJ', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.draft_transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                                                                                                                     | Required                                                                                                                                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                              | Example                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `draft_transfer_id`                                                                                                                                                                                                                                                                                                                                                                      | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the related draft transfer.                                                                                                                                                                                                                                                                                                                                            | badrt_87GByBuj4UCcUTEbs6aGJ                                                                                                                                                                                                                                                                                                                                                              |
| `testmode`                                                                                                                                                                                                                                                                                                                                                                               | *T.nilable(T::Boolean)*                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query<br/>parameter must not be sent. For organization-level credentials such as OAuth access tokens, you can enable test mode by<br/>setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                                                                                                                                                                                                                                          |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                        | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                                                                                                                                                                                                                         | 123e4567-e89b-12d3-a456-426                                                                                                                                                                                                                                                                                                                                                              |

### Response

**[T.nilable(Models::Operations::GetDraftTransferResponse)](../../models/operations/getdrafttransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## cancel

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Cancels a draft transfer created via this API. Transitions the draft transfer to `declined` with
`statusReason.code` set to `deleted-by-creator`.

Only draft transfers created via this API, and still in `pending-review`, can be cancelled this way. A
`422` is returned if the initiator has already started approving it.

In test mode, this always returns a synthetic `declined` draft. See [Create draft
transfer](create-draft-transfer) for how to simulate `approved` and `declined` outcomes.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="cancel-draft-transfer" method="delete" path="/v2/business-accounts/draft-transfers/{draftTransferId}" example="cancel-draft-transfer-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.draft_transfers.cancel(draft_transfer_id: 'badrt_87GByBuj4UCcUTEbs6aGJ', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::CancelDraftTransferRequestBody.new(
  testmode: false
))

unless res.draft_transfer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                  | Type                                                                                                                       | Required                                                                                                                   | Description                                                                                                                | Example                                                                                                                    |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `draft_transfer_id`                                                                                                        | *::String*                                                                                                                 | :heavy_check_mark:                                                                                                         | Provide the ID of the related draft transfer.                                                                              | badrt_87GByBuj4UCcUTEbs6aGJ                                                                                                |
| `idempotency_key`                                                                                                          | *T.nilable(::String)*                                                                                                      | :heavy_minus_sign:                                                                                                         | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                           | 123e4567-e89b-12d3-a456-426                                                                                                |
| `body`                                                                                                                     | [T.nilable(Models::Operations::CancelDraftTransferRequestBody)](../../models/operations/canceldrafttransferrequestbody.md) | :heavy_minus_sign:                                                                                                         | N/A                                                                                                                        |                                                                                                                            |

### Response

**[T.nilable(Models::Operations::CancelDraftTransferResponse)](../../models/operations/canceldrafttransferresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |