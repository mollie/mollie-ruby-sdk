# PaymentLinks

## Overview

### Available Operations

* [create](#create) - Create payment link
* [list](#list) - List payment links
* [get](#get) - Get payment link
* [update](#update) - Update payment link
* [delete](#delete) - Delete payment link
* [list_payments](#list_payments) - Get payment link payments

## create

With the Payment links API you can generate payment links that by default, unlike regular payments, do not expire.
The payment link can be shared with your customers and will redirect them to them the payment page where they can
complete the payment. A [payment](get-payment) will only be created once the customer initiates the payment.

### Example Usage: create-payment-link-201-1

<!-- UsageSnippet language="ruby" operationID="create-payment-link" method="post" path="/v2/payment-links" example="create-payment-link-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payment_links.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Operations::CreatePaymentLinkRequestBody.new(
  description: 'Chess Board',
  amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  minimum_amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  redirect_url: 'https://webshop.example.org/payment-links/redirect/',
  webhook_url: 'https://webshop.example.org/payment-links/webhook/',
  lines: [
    Models::Components::PaymentLineItem.new(
      type: Models::Components::PaymentLineType::PHYSICAL,
      description: 'LEGO 4440 Forest Police Station',
      quantity: 1,
      quantity_unit: 'pcs',
      unit_price: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      discount_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      total_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      vat_rate: '21.00',
      vat_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      sku: '9780241661628',
      categories: [
        Models::Components::LineCategories::MEAL,
        Models::Components::LineCategories::ECO,
      ],
      image_url: 'https://...',
      product_url: 'https://...'
    ),
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
  profile_id: 'pfl_QkEhN94Ba',
  reusable: false,
  expires_at: '2025-12-24T11:00:16+00:00',
  allowed_methods: nil,
  application_fee: Models::Operations::ApplicationFee.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    description: 'Platform fee'
  ),
  sequence_type: Models::Components::PaymentLinkSequenceType::ONEOFF,
  customer_id: 'cst_XimFHuaEzd',
  testmode: false
))

unless res.payment_link_response.nil?
  # handle response
end

```
### Example Usage: create-payment-link-201-2

<!-- UsageSnippet language="ruby" operationID="create-payment-link" method="post" path="/v2/payment-links" example="create-payment-link-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payment_links.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Operations::CreatePaymentLinkRequestBody.new(
  description: 'Chess Board',
  amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  minimum_amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  redirect_url: 'https://webshop.example.org/payment-links/redirect/',
  webhook_url: 'https://webshop.example.org/payment-links/webhook/',
  lines: [
    Models::Components::PaymentLineItem.new(
      type: Models::Components::PaymentLineType::PHYSICAL,
      description: 'LEGO 4440 Forest Police Station',
      quantity: 1,
      quantity_unit: 'pcs',
      unit_price: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      discount_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      total_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      vat_rate: '21.00',
      vat_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      sku: '9780241661628',
      categories: [
        Models::Components::LineCategories::MEAL,
        Models::Components::LineCategories::ECO,
      ],
      image_url: 'https://...',
      product_url: 'https://...'
    ),
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
  profile_id: 'pfl_QkEhN94Ba',
  reusable: false,
  expires_at: '2025-12-24T11:00:16+00:00',
  allowed_methods: nil,
  application_fee: Models::Operations::ApplicationFee.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    description: 'Platform fee'
  ),
  sequence_type: Models::Components::PaymentLinkSequenceType::ONEOFF,
  customer_id: 'cst_XimFHuaEzd',
  testmode: false
))

unless res.payment_link_response.nil?
  # handle response
end

```
### Example Usage: create-payment-link-201-3

<!-- UsageSnippet language="ruby" operationID="create-payment-link" method="post" path="/v2/payment-links" example="create-payment-link-201-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payment_links.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Operations::CreatePaymentLinkRequestBody.new(
  description: 'Chess Board',
  amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  minimum_amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  redirect_url: 'https://webshop.example.org/payment-links/redirect/',
  webhook_url: 'https://webshop.example.org/payment-links/webhook/',
  lines: [
    Models::Components::PaymentLineItem.new(
      type: Models::Components::PaymentLineType::PHYSICAL,
      description: 'LEGO 4440 Forest Police Station',
      quantity: 1,
      quantity_unit: 'pcs',
      unit_price: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      discount_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      total_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      vat_rate: '21.00',
      vat_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      sku: '9780241661628',
      categories: [
        Models::Components::LineCategories::MEAL,
        Models::Components::LineCategories::ECO,
      ],
      image_url: 'https://...',
      product_url: 'https://...'
    ),
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
  profile_id: 'pfl_QkEhN94Ba',
  reusable: false,
  expires_at: '2025-12-24T11:00:16+00:00',
  allowed_methods: nil,
  application_fee: Models::Operations::ApplicationFee.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    description: 'Platform fee'
  ),
  sequence_type: Models::Components::PaymentLinkSequenceType::ONEOFF,
  customer_id: 'cst_XimFHuaEzd',
  testmode: false
))

unless res.payment_link_response.nil?
  # handle response
end

```
### Example Usage: create-payment-link-201-4

<!-- UsageSnippet language="ruby" operationID="create-payment-link" method="post" path="/v2/payment-links" example="create-payment-link-201-4" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payment_links.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Operations::CreatePaymentLinkRequestBody.new(
  description: 'Chess Board',
  amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  minimum_amount: Models::Components::AmountNullable.new(
    currency: 'EUR',
    value: '10.00'
  ),
  redirect_url: 'https://webshop.example.org/payment-links/redirect/',
  webhook_url: 'https://webshop.example.org/payment-links/webhook/',
  lines: [
    Models::Components::PaymentLineItem.new(
      type: Models::Components::PaymentLineType::PHYSICAL,
      description: 'LEGO 4440 Forest Police Station',
      quantity: 1,
      quantity_unit: 'pcs',
      unit_price: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      discount_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      total_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      vat_rate: '21.00',
      vat_amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      sku: '9780241661628',
      categories: [
        Models::Components::LineCategories::MEAL,
        Models::Components::LineCategories::ECO,
      ],
      image_url: 'https://...',
      product_url: 'https://...'
    ),
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
  profile_id: 'pfl_QkEhN94Ba',
  reusable: false,
  expires_at: '2025-12-24T11:00:16+00:00',
  allowed_methods: nil,
  application_fee: Models::Operations::ApplicationFee.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    description: 'Platform fee'
  ),
  sequence_type: Models::Components::PaymentLinkSequenceType::ONEOFF,
  customer_id: 'cst_XimFHuaEzd',
  testmode: false
))

unless res.payment_link_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |
| `body`                                                                                                                                                                                  | [T.nilable(Models::Operations::CreatePaymentLinkRequestBody)](../../models/operations/createpaymentlinkrequestbody.md)                                                                  | :heavy_minus_sign:                                                                                                                                                                      | N/A                                                                                                                                                                                     |                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::CreatePaymentLinkResponse)](../../models/operations/createpaymentlinkresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all payment links.

The results are paginated.

### Example Usage: list-payment-links-200-1

<!-- UsageSnippet language="ruby" operationID="list-payment-links" method="get" path="/v2/payment-links" example="list-payment-links-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListPaymentLinksRequest.new(
  from: 'pl_d9fQur83kFdhH8hIhaZfq',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.payment_links.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payment-links-200-2

<!-- UsageSnippet language="ruby" operationID="list-payment-links" method="get" path="/v2/payment-links" example="list-payment-links-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListPaymentLinksRequest.new(
  from: 'pl_d9fQur83kFdhH8hIhaZfq',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.payment_links.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `request`                                                                                         | [Models::Operations::ListPaymentLinksRequest](../../models/operations/listpaymentlinksrequest.md) | :heavy_check_mark:                                                                                | The request object to use for the request.                                                        |

### Response

**[T.nilable(Models::Operations::ListPaymentLinksResponse)](../../models/operations/listpaymentlinksresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payment link by its ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-payment-link" method="get" path="/v2/payment-links/{paymentLinkId}" example="get-payment-link-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPaymentLinkRequest.new(
  payment_link_id: 'pl_d9fQur83kFdhH8hIhaZfq',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.payment_links.get(request: req)

unless res.payment_link_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request`                                                                                     | [Models::Operations::GetPaymentLinkRequest](../../models/operations/getpaymentlinkrequest.md) | :heavy_check_mark:                                                                            | The request object to use for the request.                                                    |

### Response

**[T.nilable(Models::Operations::GetPaymentLinkResponse)](../../models/operations/getpaymentlinkresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Certain details of an existing payment link can be updated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="update-payment-link" method="patch" path="/v2/payment-links/{paymentLinkId}" example="update-payment-link-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::UpdatePaymentLinkRequest.new(
  payment_link_id: 'pl_d9fQur83kFdhH8hIhaZfq',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::UpdatePaymentLinkRequestBody.new(
    description: 'Chess Board',
    minimum_amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    archived: false,
    allowed_methods: [
      Models::Components::PaymentLinkMethod::IDEAL,
    ],
    lines: nil,
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
    testmode: false
  )
)
res = s.payment_links.update(request: req)

unless res.payment_link_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::UpdatePaymentLinkRequest](../../models/operations/updatepaymentlinkrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::UpdatePaymentLinkResponse)](../../models/operations/updatepaymentlinkresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## delete

Payment links which have not been opened and no payments have been made yet can be deleted entirely.
This can be useful for removing payment links that have been incorrectly configured or that are no longer relevant.

Once deleted, the payment link will no longer show up in the API or Mollie dashboard.

To simply disable a payment link without fully deleting it, you can use the `archived` parameter on the
[Update payment link](update-payment-link) endpoint instead.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="delete-payment-link" method="delete" path="/v2/payment-links/{paymentLinkId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::DeletePaymentLinkRequest.new(
  payment_link_id: 'pl_d9fQur83kFdhH8hIhaZfq',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::DeletePaymentLinkRequestBody.new(
    testmode: false
  )
)
res = s.payment_links.delete(request: req)

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::DeletePaymentLinkRequest](../../models/operations/deletepaymentlinkrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::DeletePaymentLinkResponse)](../../models/operations/deletepaymentlinkresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_payments

Retrieve the list of payments for a specific payment link.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-payment-link-payments" method="get" path="/v2/payment-links/{paymentLinkId}/payments" example="get-payment-link-payments-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPaymentLinkPaymentsRequest.new(
  payment_link_id: 'pl_d9fQur83kFdhH8hIhaZfq',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.payment_links.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                     | Type                                                                                                          | Required                                                                                                      | Description                                                                                                   |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                     | [Models::Operations::GetPaymentLinkPaymentsRequest](../../models/operations/getpaymentlinkpaymentsrequest.md) | :heavy_check_mark:                                                                                            | The request object to use for the request.                                                                    |

### Response

**[T.nilable(Models::Operations::GetPaymentLinkPaymentsResponse)](../../models/operations/getpaymentlinkpaymentsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |