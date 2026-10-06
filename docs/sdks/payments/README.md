# Payments

## Overview

### Available Operations

* [create](#create) - Create payment
* [list](#list) - List payments
* [get](#get) - Get payment
* [update](#update) - Update payment
* [cancel](#cancel) - Cancel payment
* [release_authorization](#release_authorization) - Release payment authorization

## create

Payment creation is elemental to the Mollie API: this is where most payment
implementations start off.

Once you have created a payment, you should redirect your customer to the
URL in the `_links.checkout` property from the response.

To wrap your head around the payment process, an explanation and flow charts
can be found in the 'Accepting payments' guide.

If you specify the `method` parameter when creating a payment, optional
additional parameters may be available for the payment method that are not listed below. Please refer to the
guide on [method-specific parameters](extra-payment-parameters).

### Example Usage: create-payment-201-1

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-10

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-10" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-11

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-11" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-12

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-12" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-13

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-13" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-2

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-3

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-4

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-4" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-5

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-5" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-6

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-6" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-7

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-7" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-8

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-8" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: create-payment-201-9

<!-- UsageSnippet language="ruby" operationID="create-payment" method="post" path="/v2/payments" example="create-payment-201-9" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::PaymentRequest.new(
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
))

unless res.payment_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                            | Type                                                                                                 | Required                                                                                             | Description                                                                                          | Example                                                                                              |
| ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `include`                                                                                            | *T.nilable(::String)*                                                                                | :heavy_minus_sign:                                                                                   | This endpoint allows you to include additional information via the `include` query string parameter. |                                                                                                      |
| `idempotency_key`                                                                                    | *T.nilable(::String)*                                                                                | :heavy_minus_sign:                                                                                   | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                     | 123e4567-e89b-12d3-a456-426                                                                          |
| `body`                                                                                               | [T.nilable(Models::Components::PaymentRequest)](../../models/shared/paymentrequest.md)               | :heavy_minus_sign:                                                                                   | N/A                                                                                                  |                                                                                                      |

### Response

**[T.nilable(Models::Operations::CreatePaymentResponse)](../../models/operations/createpaymentresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Models::Errors::ErrorResponse | 503                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve all payments created with the current website profile.

The results are paginated.

### Example Usage: list-payments-200-1

<!-- UsageSnippet language="ruby" operationID="list-payments" method="get" path="/v2/payments" example="list-payments-200-1" -->
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

req = Models::Operations::ListPaymentsRequest.new(
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payments.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payments-200-2

<!-- UsageSnippet language="ruby" operationID="list-payments" method="get" path="/v2/payments" example="list-payments-200-2" -->
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

req = Models::Operations::ListPaymentsRequest.new(
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payments.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payments-200-3

<!-- UsageSnippet language="ruby" operationID="list-payments" method="get" path="/v2/payments" example="list-payments-200-3" -->
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

req = Models::Operations::ListPaymentsRequest.new(
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payments.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::ListPaymentsRequest](../../models/operations/listpaymentsrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::ListPaymentsResponse)](../../models/operations/listpaymentsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payment object by its payment ID.

### Example Usage: get-payment-200-1

<!-- UsageSnippet language="ruby" operationID="get-payment" method="get" path="/v2/payments/{paymentId}" example="get-payment-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPaymentRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payments.get(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: get-payment-200-2

<!-- UsageSnippet language="ruby" operationID="get-payment" method="get" path="/v2/payments/{paymentId}" example="get-payment-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPaymentRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payments.get(request: req)

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: get-payment-200-3

<!-- UsageSnippet language="ruby" operationID="get-payment" method="get" path="/v2/payments/{paymentId}" example="get-payment-200-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetPaymentRequest.new(
  payment_id: 'tr_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.payments.get(request: req)

unless res.payment_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                             | Type                                                                                  | Required                                                                              | Description                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `request`                                                                             | [Models::Operations::GetPaymentRequest](../../models/operations/getpaymentrequest.md) | :heavy_check_mark:                                                                    | The request object to use for the request.                                            |

### Response

**[T.nilable(Models::Operations::GetPaymentResponse)](../../models/operations/getpaymentresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Certain details of an existing payment can be updated.

Updating the payment details will not result in a webhook call.

### Example Usage: update-payment-200-1

<!-- UsageSnippet language="ruby" operationID="update-payment" method="patch" path="/v2/payments/{paymentId}" example="update-payment-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.update(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::UpdatePaymentRequestBody.new(
  description: 'Chess Board',
  redirect_url: 'https://example.org/redirect',
  cancel_url: 'https://example.org/cancel',
  webhook_url: 'https://example.org/webhooks',
  method: Models::Components::MethodEnum::IDEAL,
  locale: Models::Components::Locale2::EN_US,
  due_date: '2025-01-01',
  restrict_payment_methods_to_country: 'NL',
  testmode: false,
  issuer: 'ideal_INGBNL2A',
  billing_address: Models::Components::BillingAddress.new(
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
  shipping_address: Models::Components::ShippingAddress.new(
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
  billing_email: 'test@example.com'
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: update-payment-200-2

<!-- UsageSnippet language="ruby" operationID="update-payment" method="patch" path="/v2/payments/{paymentId}" example="update-payment-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.update(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::UpdatePaymentRequestBody.new(
  description: 'Chess Board',
  redirect_url: 'https://example.org/redirect',
  cancel_url: 'https://example.org/cancel',
  webhook_url: 'https://example.org/webhooks',
  method: Models::Components::MethodEnum::IDEAL,
  locale: Models::Components::Locale2::EN_US,
  due_date: '2025-01-01',
  restrict_payment_methods_to_country: 'NL',
  testmode: false,
  issuer: 'ideal_INGBNL2A',
  billing_address: Models::Components::BillingAddress.new(
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
  shipping_address: Models::Components::ShippingAddress.new(
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
  billing_email: 'test@example.com'
))

unless res.payment_response.nil?
  # handle response
end

```
### Example Usage: update-payment-200-3

<!-- UsageSnippet language="ruby" operationID="update-payment" method="patch" path="/v2/payments/{paymentId}" example="update-payment-200-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.update(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::UpdatePaymentRequestBody.new(
  description: 'Chess Board',
  redirect_url: 'https://example.org/redirect',
  cancel_url: 'https://example.org/cancel',
  webhook_url: 'https://example.org/webhooks',
  method: Models::Components::MethodEnum::IDEAL,
  locale: Models::Components::Locale2::EN_US,
  due_date: '2025-01-01',
  restrict_payment_methods_to_country: 'NL',
  testmode: false,
  issuer: 'ideal_INGBNL2A',
  billing_address: Models::Components::BillingAddress.new(
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
  shipping_address: Models::Components::ShippingAddress.new(
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
  billing_email: 'test@example.com'
))

unless res.payment_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `payment_id`                                                                                                   | *::String*                                                                                                     | :heavy_check_mark:                                                                                             | Provide the ID of the related payment.                                                                         | tr_5B8cwPMGnU                                                                                                  |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Operations::UpdatePaymentRequestBody)](../../models/operations/updatepaymentrequestbody.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::UpdatePaymentResponse)](../../models/operations/updatepaymentresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## cancel

Depending on the payment method, you may be able to cancel a payment for a certain amount of time — usually until
the next business day or as long as the payment status is open.

Payments may also be canceled manually from the Mollie Dashboard.

The `isCancelable` property on the [Payment object](get-payment) will indicate if the payment can be canceled.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="cancel-payment" method="delete" path="/v2/payments/{paymentId}" example="cancel-payment-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.cancel(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::CancelPaymentRequestBody.new(
  testmode: false
))

unless res.payment_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `payment_id`                                                                                                   | *::String*                                                                                                     | :heavy_check_mark:                                                                                             | Provide the ID of the related payment.                                                                         | tr_5B8cwPMGnU                                                                                                  |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Operations::CancelPaymentRequestBody)](../../models/operations/cancelpaymentrequestbody.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::CancelPaymentResponse)](../../models/operations/cancelpaymentresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## release_authorization

Releases the full remaining authorized amount. Call this endpoint when you will not be making any additional
captures. Payment authorizations may also be released manually from the Mollie Dashboard.

Mollie will do its best to process release requests, but it is not guaranteed that it will succeed. It is up to
the issuing bank if and when the hold will be released.

If the request does succeed, the payment status will change to `canceled` for payments without captures.
If there is a successful capture, the payment will transition to `paid`.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="release-authorization" method="post" path="/v2/payments/{paymentId}/release-authorization" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.payments.release_authorization(payment_id: 'tr_5B8cwPMGnU', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::ReleaseAuthorizationRequestBody.new(
  profile_id: 'pfl_5B8cwPMGnU',
  testmode: false
))

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                                                    | Type                                                                                                                         | Required                                                                                                                     | Description                                                                                                                  | Example                                                                                                                      |
| ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `payment_id`                                                                                                                 | *::String*                                                                                                                   | :heavy_check_mark:                                                                                                           | Provide the ID of the related payment.                                                                                       | tr_5B8cwPMGnU                                                                                                                |
| `idempotency_key`                                                                                                            | *T.nilable(::String)*                                                                                                        | :heavy_minus_sign:                                                                                                           | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                             | 123e4567-e89b-12d3-a456-426                                                                                                  |
| `body`                                                                                                                       | [T.nilable(Models::Operations::ReleaseAuthorizationRequestBody)](../../models/operations/releaseauthorizationrequestbody.md) | :heavy_minus_sign:                                                                                                           | N/A                                                                                                                          |                                                                                                                              |

### Response

**[T.nilable(Models::Operations::ReleaseAuthorizationResponse)](../../models/operations/releaseauthorizationresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |