# SalesInvoices

## Overview

### Available Operations

* [create](#create) - Create sales invoice
* [list](#list) - List sales invoices
* [get](#get) - Get sales invoice
* [update](#update) - Update sales invoice
* [delete](#delete) - Delete sales invoice

## create

With the Sales Invoice API you can generate sales invoices to send to your customers.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-sales-invoice" method="post" path="/v2/sales-invoices" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.sales_invoices.create(idempotency_key: '123e4567-e89b-12d3-a456-426', x_client_signature: 'MEUCIQDx8sJvK3z...', x_client_signed_at: '2025-01-01T12:00:00Z', body: Models::Components::SalesInvoiceRequest.new(
  testmode: false,
  profile_id: 'pfl_QkEhN94Ba',
  status: Models::Components::SalesInvoiceStatus::DRAFT,
  vat_scheme: Models::Components::SalesInvoiceVatScheme::STANDARD,
  vat_mode: Models::Components::SalesInvoiceVatMode::EXCLUSIVE,
  memo: 'This is a memo!',
  payment_term: Models::Components::SalesInvoicePaymentTerm::THIRTYDAYS,
  payment_details: Models::Components::SalesInvoicePaymentDetails.new(
    source: Models::Components::SalesInvoicePaymentDetailsSource::PAYMENT_LINK,
    source_reference: 'pl_d9fQur83kFdhH8hIhaZfq'
  ),
  email_details: Models::Components::SalesInvoiceEmailDetails.new(
    subject: 'Your invoice is available',
    body: 'Please find your invoice enclosed.'
  ),
  customer_id: 'cst_8wmqcHMN4U',
  mandate_id: 'mdt_pWUnw6pkBN',
  recipient_identifier: 'customer-xyz-0123',
  recipient: Models::Components::SalesInvoiceRecipient.new(
    type: Models::Components::SalesInvoiceRecipientType::CONSUMER,
    title: 'Mrs.',
    given_name: 'Jane',
    family_name: 'Doe',
    organization_name: 'Organization Corp.',
    organization_number: '12345678',
    vat_number: 'NL123456789B01',
    email: 'example@email.com',
    phone: '+0123456789',
    street_and_number: 'Keizersgracht 126',
    street_additional: '4th floor',
    postal_code: '5678AB',
    city: 'Amsterdam',
    region: 'Noord-Holland',
    country: 'NL',
    locale: Models::Components::SalesInvoiceRecipientLocale::NL_NL
  ),
  lines: [
    Models::Components::SalesInvoiceLineItem.new(
      description: 'LEGO 4440 Forest Police Station',
      quantity: 1,
      vat_rate: '21.00',
      unit_price: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      discount: Models::Components::SalesInvoiceDiscount.new(
        type: Models::Components::SalesInvoiceDiscountType::AMOUNT,
        value: '10.00'
      )
    ),
  ],
  discount: Models::Components::SalesInvoiceDiscount.new(
    type: Models::Components::SalesInvoiceDiscountType::AMOUNT,
    value: '10.00'
  ),
  is_e_invoice: false
))

unless res.sales_invoice_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                               | Type                                                                                                                                                                                    | Required                                                                                                                                                                                | Description                                                                                                                                                                             | Example                                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                                             |
| `x_client_signature`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | A cryptographic signature of the request, used to verify that it was sent by you and hasn't been tampered with. Required if you've enabled request signing for your integration.        | MEUCIQDx8sJvK3z...                                                                                                                                                                      |
| `x_client_signed_at`                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                      | The timestamp, in ISO 8601 format, at which you generated the `X-Client-Signature`. Required together with `X-Client-Signature` if you've enabled request signing for your integration. | 2025-01-01T12:00:00Z                                                                                                                                                                    |
| `body`                                                                                                                                                                                  | [T.nilable(Models::Components::SalesInvoiceRequest)](../../models/shared/salesinvoicerequest.md)                                                                                        | :heavy_minus_sign:                                                                                                                                                                      | N/A                                                                                                                                                                                     |                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::CreateSalesInvoiceResponse)](../../models/operations/createsalesinvoiceresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve a list of all sales invoices created through the API.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-sales-invoices" method="get" path="/v2/sales-invoices" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListSalesInvoicesRequest.new(
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.sales_invoices.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::ListSalesInvoicesRequest](../../models/operations/listsalesinvoicesrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::ListSalesInvoicesResponse)](../../models/operations/listsalesinvoicesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single sales invoice by its ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-sales-invoice" method="get" path="/v2/sales-invoices/{salesInvoiceId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetSalesInvoiceRequest.new(
  sales_invoice_id: 'invoice_4Y0eZitmBnQ6IDoMqZQKh',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.sales_invoices.get(request: req)

unless res.sales_invoice_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::GetSalesInvoiceRequest](../../models/operations/getsalesinvoicerequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::GetSalesInvoiceResponse)](../../models/operations/getsalesinvoiceresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Certain details of an existing sales invoice can be updated. For `draft` it is all values listed below, but for
statuses `paid` and `issued` there are certain additional requirements (`paymentDetails` and `emailDetails`,
respectively).

### Example Usage

<!-- UsageSnippet language="ruby" operationID="update-sales-invoice" method="patch" path="/v2/sales-invoices/{salesInvoiceId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::UpdateSalesInvoiceRequest.new(
  sales_invoice_id: 'invoice_4Y0eZitmBnQ6IDoMqZQKh',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::UpdateSalesInvoiceRequestBody.new(
    testmode: false,
    status: Models::Components::SalesInvoiceStatusUpdate::DRAFT,
    memo: 'An updated memo!',
    payment_term: Models::Components::SalesInvoicePaymentTerm::THIRTYDAYS,
    payment_details: Models::Components::SalesInvoicePaymentDetails.new(
      source: Models::Components::SalesInvoicePaymentDetailsSource::PAYMENT_LINK,
      source_reference: 'pl_d9fQur83kFdhH8hIhaZfq'
    ),
    email_details: Models::Components::SalesInvoiceEmailDetails.new(
      subject: 'Your invoice is available',
      body: 'Please find your invoice enclosed.'
    ),
    recipient_identifier: 'customer-xyz-0123',
    recipient: Models::Components::SalesInvoiceRecipient.new(
      type: Models::Components::SalesInvoiceRecipientType::CONSUMER,
      title: 'Mrs.',
      given_name: 'Jane',
      family_name: 'Doe',
      organization_name: 'Organization Corp.',
      organization_number: '12345678',
      vat_number: 'NL123456789B01',
      email: 'example@email.com',
      phone: '+0123456789',
      street_and_number: 'Keizersgracht 126',
      street_additional: '4th floor',
      postal_code: '5678AB',
      city: 'Amsterdam',
      region: 'Noord-Holland',
      country: 'NL',
      locale: Models::Components::SalesInvoiceRecipientLocale::NL_NL
    ),
    lines: [
      Models::Components::SalesInvoiceLineItem.new(
        description: 'LEGO 4440 Forest Police Station',
        quantity: 1,
        vat_rate: '21.00',
        unit_price: Models::Components::Amount.new(
          currency: 'EUR',
          value: '10.00'
        ),
        discount: Models::Components::SalesInvoiceDiscount.new(
          type: Models::Components::SalesInvoiceDiscountType::AMOUNT,
          value: '10.00'
        )
      ),
    ],
    discount: Models::Components::SalesInvoiceDiscount.new(
      type: Models::Components::SalesInvoiceDiscountType::AMOUNT,
      value: '10.00'
    ),
    is_e_invoice: false
  )
)
res = s.sales_invoices.update(request: req)

unless res.sales_invoice_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::UpdateSalesInvoiceRequest](../../models/operations/updatesalesinvoicerequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::UpdateSalesInvoiceResponse)](../../models/operations/updatesalesinvoiceresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## delete

Sales invoices which are in status `draft` can be deleted. For all other statuses, please use the
[Update sales invoice](update-sales-invoice) endpoint instead.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="delete-sales-invoice" method="delete" path="/v2/sales-invoices/{salesInvoiceId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::DeleteSalesInvoiceRequest.new(
  sales_invoice_id: 'invoice_4Y0eZitmBnQ6IDoMqZQKh',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::DeleteValuesSalesInvoice.new(
    testmode: false
  )
)
res = s.sales_invoices.delete(request: req)

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::DeleteSalesInvoiceRequest](../../models/operations/deletesalesinvoicerequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::DeleteSalesInvoiceResponse)](../../models/operations/deletesalesinvoiceresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |