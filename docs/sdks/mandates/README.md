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
res = s.mandates.create(customer_id: 'cst_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::MandateRequest.new(
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
))

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
res = s.mandates.create(customer_id: 'cst_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::MandateRequest.new(
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
))

unless res.mandate_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                              | Type                                                                                   | Required                                                                               | Description                                                                            | Example                                                                                |
| -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `customer_id`                                                                          | *::String*                                                                             | :heavy_check_mark:                                                                     | Provide the ID of the related customer.                                                | cst_5B8cwPMGnU                                                                         |
| `idempotency_key`                                                                      | *T.nilable(::String)*                                                                  | :heavy_minus_sign:                                                                     | A unique key to ensure idempotent requests. This key should be a UUID v4 string.       | 123e4567-e89b-12d3-a456-426                                                            |
| `body`                                                                                 | [T.nilable(Models::Components::MandateRequest)](../../models/shared/mandaterequest.md) | :heavy_minus_sign:                                                                     | N/A                                                                                    |                                                                                        |

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
  idempotency_key: '123e4567-e89b-12d3-a456-426'
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
res = s.mandates.get(customer_id: 'cst_5B8cwPMGnU', mandate_id: 'mdt_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.mandate_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                                                                                                                     | Required                                                                                                                                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                                                                                                                                                                                              | Example                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `customer_id`                                                                                                                                                                                                                                                                                                                                                                            | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the related customer.                                                                                                                                                                                                                                                                                                                                                  | cst_5B8cwPMGnU                                                                                                                                                                                                                                                                                                                                                                           |
| `mandate_id`                                                                                                                                                                                                                                                                                                                                                                             | *::String*                                                                                                                                                                                                                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                                                                                                                                                                                                       | Provide the ID of the related mandate.                                                                                                                                                                                                                                                                                                                                                   | mdt_5B8cwPMGnU                                                                                                                                                                                                                                                                                                                                                                           |
| `testmode`                                                                                                                                                                                                                                                                                                                                                                               | *T.nilable(T::Boolean)*                                                                                                                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query<br/>parameter must not be sent. For organization-level credentials such as OAuth access tokens, you can enable test mode by<br/>setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                                                                                                                                                                                                                                          |
| `idempotency_key`                                                                                                                                                                                                                                                                                                                                                                        | *T.nilable(::String)*                                                                                                                                                                                                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                                                                                                                                                                       | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                                                                                                                                                                                                                         | 123e4567-e89b-12d3-a456-426                                                                                                                                                                                                                                                                                                                                                              |

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
res = s.mandates.revoke(customer_id: 'cst_5B8cwPMGnU', mandate_id: 'mdt_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::RevokeMandateRequestBody.new(
  testmode: false
))

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `customer_id`                                                                                                  | *::String*                                                                                                     | :heavy_check_mark:                                                                                             | Provide the ID of the related customer.                                                                        | cst_5B8cwPMGnU                                                                                                 |
| `mandate_id`                                                                                                   | *::String*                                                                                                     | :heavy_check_mark:                                                                                             | Provide the ID of the related mandate.                                                                         | mdt_5B8cwPMGnU                                                                                                 |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Operations::RevokeMandateRequestBody)](../../models/operations/revokemandaterequestbody.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::RevokeMandateResponse)](../../models/operations/revokemandateresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |