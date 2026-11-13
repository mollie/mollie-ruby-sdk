# Customers

## Overview

### Available Operations

* [create](#create) - Create customer
* [list](#list) - List customers
* [get](#get) - Get customer
* [update](#update) - Update customer
* [delete](#delete) - Delete customer
* [create_payment](#create_payment) - Create customer payment
* [list_payments](#list_payments) - List customer payments

## create

Creates a simple minimal representation of a customer. Payments, recurring mandates, and subscriptions can be linked
to this customer object, which simplifies management of recurring payments.

Once registered, customers will also appear in your Mollie dashboard.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-customer" method="post" path="/v2/customers" example="create-customer-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.customers.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::EntityCustomer.new(
  name: 'John Doe',
  email: 'example@email.com',
  locale: Models::Components::LocaleResponse::EN_US,
  testmode: false
))

unless res.customer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |
| `body`                                                                                                                                                                                  | [T.nilable(Models::Components::EntityCustomer)](../../models/shared/entitycustomer.md)                                                                                                  | :heavy_minus_sign:                                                                                                                                                                      | N/A                                                                                                                                                                                     |                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::CreateCustomerResponse)](../../models/operations/createcustomerresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all customers.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-customers" method="get" path="/v2/customers" example="list-customers" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListCustomersRequest.new(
  from: 'cst_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.customers.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::ListCustomersRequest](../../models/operations/listcustomersrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::ListCustomersResponse)](../../models/operations/listcustomersresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single customer by its ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-customer" method="get" path="/v2/customers/{customerId}" example="get-customer-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetCustomerRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.customers.get(request: req)

unless res.customer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::GetCustomerRequest](../../models/operations/getcustomerrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::GetCustomerResponse)](../../models/operations/getcustomerresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update an existing customer.

For an in-depth explanation of each parameter, refer to the [Create customer](create-customer) endpoint.

### Example Usage: update-customer-200-1

<!-- UsageSnippet language="ruby" operationID="update-customer" method="patch" path="/v2/customers/{customerId}" example="update-customer-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::UpdateCustomerRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::UpdateCustomerRequestBody.new(
    name: 'John Doe',
    email: 'example@email.com',
    locale: Models::Components::LocaleResponse::EN_US,
    testmode: false
  )
)
res = s.customers.update(request: req)

unless res.customer_response.nil?
  # handle response
end

```
### Example Usage: update-customer-200-2

<!-- UsageSnippet language="ruby" operationID="update-customer" method="patch" path="/v2/customers/{customerId}" example="update-customer-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::UpdateCustomerRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::UpdateCustomerRequestBody.new(
    name: 'John Doe',
    email: 'example@email.com',
    locale: Models::Components::LocaleResponse::EN_US,
    testmode: false
  )
)
res = s.customers.update(request: req)

unless res.customer_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request`                                                                                     | [Models::Operations::UpdateCustomerRequest](../../models/operations/updatecustomerrequest.md) | :heavy_check_mark:                                                                            | The request object to use for the request.                                                    |

### Response

**[T.nilable(Models::Operations::UpdateCustomerResponse)](../../models/operations/updatecustomerresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## delete

Delete a customer. All mandates and subscriptions created for this customer will be canceled as well.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="delete-customer" method="delete" path="/v2/customers/{customerId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::DeleteCustomerRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::DeleteCustomerRequestBody.new(
    testmode: false
  )
)
res = s.customers.delete(request: req)

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request`                                                                                     | [Models::Operations::DeleteCustomerRequest](../../models/operations/deletecustomerrequest.md) | :heavy_check_mark:                                                                            | The request object to use for the request.                                                    |

### Response

**[T.nilable(Models::Operations::DeleteCustomerResponse)](../../models/operations/deletecustomerresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## create_payment

Creates a payment for the customer.

Linking customers to payments enables you to:

* Keep track of payment preferences for your customers
* Allow your customers to charge a previously used credit card with a single click in our hosted checkout
* Improve payment insights in the Mollie dashboard
* Use recurring payments

This endpoint is effectively an alias of the [Create payment endpoint](create-payment) with the `customerId`
parameter predefined.

### Example Usage: create-payment-201-1

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-10

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-10" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-11

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-11" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-12

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-12" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-13

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-13" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-2

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-3

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-4

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-4" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-5

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-5" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-6

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-6" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-7

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-7" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-8

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-8" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-9

<!-- UsageSnippet language="ruby" operationID="create-customer-payment" method="post" path="/v2/customers/{customerId}/payments" example="create-payment-201-9" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateCustomerPaymentRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::PaymentRequest.new(
    description: 'Chess Board',
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    redirect_url: 'https://example.org/redirect',
    cancel_url: 'https://example.org/cancel',
    webhook_url: 'https://example.org/webhooks',
    lines: [
      Models::Components::PaymentRequestLine.new(
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
        product_url: 'https://...',
        recurring: Models::Components::RecurringLineItem.new(
          description: 'Gym subscription',
          interval: '12 months',
          amount: Models::Components::Amount.new(
            currency: 'EUR',
            value: '10.00'
          ),
          times: 1,
          start_date: '2024-12-12'
        )
      ),
    ],
    billing_address: Models::Components::PaymentRequestBillingAddress.new(
      title: 'Mr.',
      given_name: 'Piet',
      family_name: 'Mondriaan',
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
    locale: Models::Components::Locale::EN_US,
    method: Models::Components::MethodEnum::IDEAL,
    issuer: 'ideal_INGBNL2A',
    restrict_payment_methods_to_country: 'NL',
    capture_mode: Models::Components::CaptureMode::MANUAL,
    capture_delay: '8 hours',
    application_fee: Models::Components::PaymentRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    routing: [
      Models::Components::EntityPaymentRoute.new(
        amount: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        destination: Models::Components::EntityPaymentRouteDestination.new(
          type: Models::Components::RouteDestinationType::ORGANIZATION,
          organization_id: 'org_1234567'
        ),
        release_date: '2024-12-12'
      ),
    ],
    sequence_type: Models::Components::SequenceType::ONEOFF,
    mandate_id: 'mdt_5B8cwPMGnU',
    customer_id: 'cst_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    due_date: '2025-12-08',
    store_credentials: true,
    testmode: false,
    apple_pay_payment_token: '{"paymentData": {"version": "EC_v1", "data": "vK3BbrCbI/...."}}',
    company: Models::Components::Company.new(
      registration_number: '12345678',
      vat_number: 'NL123456789B01',
      entity_type: 'LLC'
    ),
    card_token: 'tkn_12345',
    google_pay_payment_token: '{"signature": "MEYCIQCv...", "protocolVersion": "ECv2", "signedMessage": "{\\"encryptedMessage\\":\\"...\\",\\"ephemeralPublicKey\\":\\"...\\",\\"tag\\":\\"...\\"}"}',
    voucher_number: '1234567890',
    voucher_pin: '1234',
    consumer_date_of_birth: Date.parse('2000-01-01'),
    digital_goods: true,
    customer_reference: '1234567890',
    terminal_id: 'term_1234567890'
  )
)
res = s.customers.create_payment(request: req)

unless res.payment_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                   | Type                                                                                                        | Required                                                                                                    | Description                                                                                                 |
| ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                   | [Models::Operations::CreateCustomerPaymentRequest](../../models/operations/createcustomerpaymentrequest.md) | :heavy_check_mark:                                                                                          | The request object to use for the request.                                                                  |

### Response

**[T.nilable(Models::Operations::CreateCustomerPaymentResponse)](../../models/operations/createcustomerpaymentresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Models::Errors::ErrorResponse | 503                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_payments

Retrieve all payments linked to the customer.

### Example Usage: list-payments-200-1

<!-- UsageSnippet language="ruby" operationID="list-customer-payments" method="get" path="/v2/customers/{customerId}/payments" example="list-payments-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  profile_id: '<id>',
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListCustomerPaymentsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.customers.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payments-200-2

<!-- UsageSnippet language="ruby" operationID="list-customer-payments" method="get" path="/v2/customers/{customerId}/payments" example="list-payments-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  profile_id: '<id>',
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListCustomerPaymentsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.customers.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payments-200-3

<!-- UsageSnippet language="ruby" operationID="list-customer-payments" method="get" path="/v2/customers/{customerId}/payments" example="list-payments-200-3" -->
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

req = Models::Operations::ListCustomerPaymentsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.customers.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                 | [Models::Operations::ListCustomerPaymentsRequest](../../models/operations/listcustomerpaymentsrequest.md) | :heavy_check_mark:                                                                                        | The request object to use for the request.                                                                |

### Response

**[T.nilable(Models::Operations::ListCustomerPaymentsResponse)](../../models/operations/listcustomerpaymentsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |