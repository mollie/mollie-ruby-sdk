# CheckoutSessions

## Overview

### Available Operations

* [create](#create) - Create Checkout Session
* [get](#get) - Get Checkout Session

## create

> 🚧 Beta feature
>
> This feature is currently in beta.
>
> The `shipping` and `requiredCustomerDetails` properties are still in private beta.

Create a Checkout Session to start a checkout process with Mollie Components.

### Example Usage: create-session-201-1

<!-- UsageSnippet language="ruby" operationID="create-session" method="post" path="/v2/sessions" example="create-session-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.checkout_sessions.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::SessionRequest.new(
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'Order #12345',
  lines: [],
  redirect_url: 'https://example.org/redirect',
  required_customer_details: [
    Models::Components::SessionRequiredCustomerDetails::BILLING_ADDRESS,
  ],
  billing_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping: Models::Components::SessionRequestShipping1.new(
    options: [
      Models::Components::SessionRequestOption1.new(
        description: 'Next day delivery',
        reference: 'express',
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        )
      ),
    ],
    callback_url: 'https://example.org/shipping-options'
  ),
  customer_id: 'cst_5B8cwPMGnU',
  sequence_type: Models::Components::SessionSequenceType::ONEOFF,
  payment: Models::Components::SessionRequestPayment.new(
    webhook_url: 'https://example.org/webhook'
  ),
  profile_id: 'pfl_5B8cwPMGnU',
  testmode: false
))

unless res.session_response.nil?
  # handle response
end

```
### Example Usage: create-session-201-2

<!-- UsageSnippet language="ruby" operationID="create-session" method="post" path="/v2/sessions" example="create-session-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.checkout_sessions.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::SessionRequest.new(
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'Order #12345',
  lines: [],
  redirect_url: 'https://example.org/redirect',
  required_customer_details: [
    Models::Components::SessionRequiredCustomerDetails::BILLING_ADDRESS,
  ],
  billing_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping: Models::Components::SessionRequestShipping1.new(
    options: [
      Models::Components::SessionRequestOption1.new(
        description: 'Next day delivery',
        reference: 'express',
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        )
      ),
    ],
    callback_url: 'https://example.org/shipping-options'
  ),
  customer_id: 'cst_5B8cwPMGnU',
  sequence_type: Models::Components::SessionSequenceType::ONEOFF,
  payment: Models::Components::SessionRequestPayment.new(
    webhook_url: 'https://example.org/webhook'
  ),
  profile_id: 'pfl_5B8cwPMGnU',
  testmode: false
))

unless res.session_response.nil?
  # handle response
end

```
### Example Usage: create-session-201-3

<!-- UsageSnippet language="ruby" operationID="create-session" method="post" path="/v2/sessions" example="create-session-201-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.checkout_sessions.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::SessionRequest.new(
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'Order #12345',
  lines: [],
  redirect_url: 'https://example.org/redirect',
  required_customer_details: [
    Models::Components::SessionRequiredCustomerDetails::BILLING_ADDRESS,
  ],
  billing_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping: Models::Components::SessionRequestShipping1.new(
    options: [
      Models::Components::SessionRequestOption1.new(
        description: 'Next day delivery',
        reference: 'express',
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        )
      ),
    ],
    callback_url: 'https://example.org/shipping-options'
  ),
  customer_id: 'cst_5B8cwPMGnU',
  sequence_type: Models::Components::SessionSequenceType::ONEOFF,
  payment: Models::Components::SessionRequestPayment.new(
    webhook_url: 'https://example.org/webhook'
  ),
  profile_id: 'pfl_5B8cwPMGnU',
  testmode: false
))

unless res.session_response.nil?
  # handle response
end

```
### Example Usage: create-session-201-4

<!-- UsageSnippet language="ruby" operationID="create-session" method="post" path="/v2/sessions" example="create-session-201-4" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.checkout_sessions.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::SessionRequest.new(
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  description: 'Order #12345',
  lines: [],
  redirect_url: 'https://example.org/redirect',
  required_customer_details: [
    Models::Components::SessionRequiredCustomerDetails::BILLING_ADDRESS,
  ],
  billing_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping_address: Models::Components::PaymentAddress.new(
    title: 'Mr.',
    given_name: 'Piet',
    family_name: 'Mondriaan',
    organization_name: 'Mollie B.V.',
    street_and_number: 'Keizersgracht 126',
    street_additional: 'Apt. 1',
    postal_code: '1234AB',
    email: 'piet@example.org',
    phone: '31208202070',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL'
  ),
  shipping: Models::Components::SessionRequestShipping1.new(
    options: [
      Models::Components::SessionRequestOption1.new(
        description: 'Next day delivery',
        reference: 'express',
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        )
      ),
    ],
    callback_url: 'https://example.org/shipping-options'
  ),
  customer_id: 'cst_5B8cwPMGnU',
  sequence_type: Models::Components::SessionSequenceType::ONEOFF,
  payment: Models::Components::SessionRequestPayment.new(
    webhook_url: 'https://example.org/webhook'
  ),
  profile_id: 'pfl_5B8cwPMGnU',
  testmode: false
))

unless res.session_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |
| `body`                                                                                                                                                                                  | [T.nilable(Models::Components::SessionRequest)](../../models/shared/sessionrequest.md)                                                                                                  | :heavy_minus_sign:                                                                                                                                                                      | N/A                                                                                                                                                                                     |                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::CreateSessionResponse)](../../models/operations/createsessionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

> 🚧 Beta feature
>
> This feature is currently in beta.
>
> The `shipping` and `requiredCustomerDetails` properties are still in private beta.

Retrieve a Checkout Session to view its details and status to inform your customers about the checkout process.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-session" method="get" path="/v2/sessions/{sessionId}" example="get-session-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.checkout_sessions.get(session_id: 'sess_82jFYDTrLcCQV68NLDvMJ', idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z')

unless res.session_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `session_id`                                                                                                                                                                            | *::String*                                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                                      | Provide the ID of the related Checkout Session.                                                                                                                                         | sess_82jFYDTrLcCQV68NLDvMJ                                                                                                                                                              |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |

### Response

**[T.nilable(Models::Operations::GetSessionResponse)](../../models/operations/getsessionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 429                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |