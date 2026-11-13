# Mandates

## Overview

### Available Operations

* [create](#create) - Create mandate
* [list](#list) - List mandates
* [get](#get) - Get mandate
* [revoke](#revoke) - Revoke mandate

## create

Create a mandate for a specific customer. Mandates allow you to charge a customer's card, PayPal account or bank
account recurrently.

It is only possible to create mandates for IBANs and PayPal billing agreements with this endpoint. To create
mandates for cards, your customers need to perform a 'first payment' with their card.

### Example Usage: create-mandate-201-1

<!-- UsageSnippet language="ruby" operationID="create-mandate" method="post" path="/v2/customers/{customerId}/mandates" example="create-mandate-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateMandateRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::MandateRequest.new(
    id: 'mdt_5B8cwPMGnU',
    method: Models::Components::MandateMethod::DIRECTDEBIT,
    consumer_name: 'John Doe',
    consumer_account: 'NL55INGB0000000000',
    consumer_bic: 'BANKBIC',
    consumer_email: 'example@email.com',
    signature_date: '2025-01-01',
    mandate_reference: 'ID-1023892',
    paypal_billing_agreement_id: 'B-12A34567B8901234CD',
    pay_pal_vault_id: '8kk8451t',
    testmode: false
  )
)
res = s.mandates.create(request: req)

unless res.mandate_response.nil?
  # handle response
end

```
### Example Usage: create-mandate-201-2

<!-- UsageSnippet language="ruby" operationID="create-mandate" method="post" path="/v2/customers/{customerId}/mandates" example="create-mandate-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateMandateRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::MandateRequest.new(
    id: 'mdt_5B8cwPMGnU',
    method: Models::Components::MandateMethod::DIRECTDEBIT,
    consumer_name: 'John Doe',
    consumer_account: 'NL55INGB0000000000',
    consumer_bic: 'BANKBIC',
    consumer_email: 'example@email.com',
    signature_date: '2025-01-01',
    mandate_reference: 'ID-1023892',
    paypal_billing_agreement_id: 'B-12A34567B8901234CD',
    pay_pal_vault_id: '8kk8451t',
    testmode: false
  )
)
res = s.mandates.create(request: req)

unless res.mandate_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::CreateMandateRequest](../../models/operations/createmandaterequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::CreateMandateResponse)](../../models/operations/createmandateresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all mandates.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-mandates" method="get" path="/v2/customers/{customerId}/mandates" example="list-mandates-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListMandatesRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  from: 'mdt_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  scopes: [
    Models::Components::MandateScopes::CUSTOMER_PRESENT,
  ],
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.mandates.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::ListMandatesRequest](../../models/operations/listmandatesrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::ListMandatesResponse)](../../models/operations/listmandatesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single mandate by its ID. Depending on the type of mandate, the object will contain the customer's bank
account details, card details, or PayPal account details.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-mandate" method="get" path="/v2/customers/{customerId}/mandates/{mandateId}" example="get-mandate-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetMandateRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  mandate_id: 'mdt_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.mandates.get(request: req)

unless res.mandate_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                             | Type                                                                                  | Required                                                                              | Description                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `request`                                                                             | [Models::Operations::GetMandateRequest](../../models/operations/getmandaterequest.md) | :heavy_check_mark:                                                                    | The request object to use for the request.                                            |

### Response

**[T.nilable(Models::Operations::GetMandateResponse)](../../models/operations/getmandateresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## revoke

Revoke a customer's mandate. You will no longer be able to charge the customer's bank account or card with this
mandate, and all connected subscriptions will be canceled.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="revoke-mandate" method="delete" path="/v2/customers/{customerId}/mandates/{mandateId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::RevokeMandateRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  mandate_id: 'mdt_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::RevokeMandateRequestBody.new(
    testmode: false
  )
)
res = s.mandates.revoke(request: req)

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::RevokeMandateRequest](../../models/operations/revokemandaterequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::RevokeMandateResponse)](../../models/operations/revokemandateresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |