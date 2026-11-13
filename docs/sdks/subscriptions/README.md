# Subscriptions

## Overview

### Available Operations

* [create](#create) - Create subscription
* [list](#list) - List customer subscriptions
* [get](#get) - Get subscription
* [update](#update) - Update subscription
* [cancel](#cancel) - Cancel subscription
* [all](#all) - List all subscriptions
* [list_payments](#list_payments) - List subscription payments

## create

With subscriptions, you can schedule recurring payments to take place at regular intervals.

For example, by simply specifying an `amount` and an `interval`, you can create an endless subscription to charge a
monthly fee, until you cancel the subscription.

Or, you could use the times parameter to only charge a limited number of times, for example to split a big
transaction in multiple parts.

A few example usages:

`amount[currency]="EUR"` `amount[value]="5.00"` `interval="2 weeks"`
Your customer will be charged €5 once every two weeks.

`amount[currency]="EUR"` `amount[value]="20.00"` `interval="1 day" times=5`
Your customer will be charged €20 every day, for five consecutive days.

`amount[currency]="EUR"` `amount[value]="10.00"` `interval="1 month"`
`startDate="2018-04-30"`
Your customer will be charged €10 on the last day of each month, starting in April 2018.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-subscription" method="post" path="/v2/customers/{customerId}/subscriptions" example="get-subscription-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CreateSubscriptionRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Components::SubscriptionRequest.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    times: 6,
    interval: '2 days',
    start_date: '2025-01-01',
    description: 'Subscription of streaming channel',
    method: Models::Components::SubscriptionMethod::PAYPAL,
    application_fee: Models::Components::SubscriptionRequestApplicationFee.new(
      amount: Models::Components::Amount.new(
        currency: 'EUR',
        value: '10.00'
      ),
      description: 'Platform fee'
    ),
    webhook_url: 'https://example.com/webhook',
    mandate_id: 'mdt_5B8cwPMGnU',
    profile_id: 'pfl_5B8cwPMGnU',
    testmode: false
  )
)
res = s.subscriptions.create(request: req)

unless res.subscription_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::CreateSubscriptionRequest](../../models/operations/createsubscriptionrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::CreateSubscriptionResponse)](../../models/operations/createsubscriptionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Retrieve all subscriptions of a customer.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-subscriptions" method="get" path="/v2/customers/{customerId}/subscriptions" example="list-subscriptions-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListSubscriptionsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  from: 'sub_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.subscriptions.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `request`                                                                                           | [Models::Operations::ListSubscriptionsRequest](../../models/operations/listsubscriptionsrequest.md) | :heavy_check_mark:                                                                                  | The request object to use for the request.                                                          |

### Response

**[T.nilable(Models::Operations::ListSubscriptionsResponse)](../../models/operations/listsubscriptionsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single subscription by its ID and the ID of its parent customer.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-subscription" method="get" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}" example="get-subscription-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetSubscriptionRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.subscriptions.get(request: req)

unless res.subscription_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::GetSubscriptionRequest](../../models/operations/getsubscriptionrequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::GetSubscriptionResponse)](../../models/operations/getsubscriptionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Update an existing subscription.

Canceled subscriptions cannot be updated.

For an in-depth explanation of each parameter, refer to the [Create subscription](create-subscription) endpoint.

### Example Usage: update-subscription-200-1

<!-- UsageSnippet language="ruby" operationID="update-subscription" method="patch" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}" example="update-subscription-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::UpdateSubscriptionRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::UpdateSubscriptionRequestBody.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    description: 'Subscription of streaming channel',
    interval: '1 months',
    start_date: '2025-01-01',
    times: 6,
    webhook_url: 'https://example.com/webhook',
    mandate_id: 'mdt_5B8cwPMGnU',
    testmode: false
  )
)
res = s.subscriptions.update(request: req)

unless res.subscription_response.nil?
  # handle response
end

```
### Example Usage: update-subscription-200-2

<!-- UsageSnippet language="ruby" operationID="update-subscription" method="patch" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}" example="update-subscription-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::UpdateSubscriptionRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::UpdateSubscriptionRequestBody.new(
    amount: Models::Components::Amount.new(
      currency: 'EUR',
      value: '10.00'
    ),
    description: 'Subscription of streaming channel',
    interval: '1 months',
    start_date: '2025-01-01',
    times: 6,
    webhook_url: 'https://example.com/webhook',
    mandate_id: 'mdt_5B8cwPMGnU',
    testmode: false
  )
)
res = s.subscriptions.update(request: req)

unless res.subscription_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::UpdateSubscriptionRequest](../../models/operations/updatesubscriptionrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::UpdateSubscriptionResponse)](../../models/operations/updatesubscriptionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## cancel

Cancel an existing subscription. Canceling a subscription has no effect on the mandates of the customer.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="cancel-subscription" method="delete" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}" example="cancel-subscription-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::CancelSubscriptionRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z',
  body: Models::Operations::CancelSubscriptionRequestBody.new(
    testmode: false
  )
)
res = s.subscriptions.cancel(request: req)

unless res.subscription_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::CancelSubscriptionRequest](../../models/operations/cancelsubscriptionrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::CancelSubscriptionResponse)](../../models/operations/cancelsubscriptionresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## all

Retrieve all subscriptions initiated across all your customers.

The results are paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-all-subscriptions" method="get" path="/v2/subscriptions" example="list-subscriptions-200-1" -->
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

req = Models::Operations::ListAllSubscriptionsRequest.new(
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.subscriptions.all(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                 | [Models::Operations::ListAllSubscriptionsRequest](../../models/operations/listallsubscriptionsrequest.md) | :heavy_check_mark:                                                                                        | The request object to use for the request.                                                                |

### Response

**[T.nilable(Models::Operations::ListAllSubscriptionsResponse)](../../models/operations/listallsubscriptionsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_payments

Retrieve all payments of a specific subscription.

The results are paginated.

### Example Usage: list-payments-200-1

<!-- UsageSnippet language="ruby" operationID="list-subscription-payments" method="get" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}/payments" example="list-payments-200-1" -->
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

req = Models::Operations::ListSubscriptionPaymentsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.subscriptions.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payments-200-2

<!-- UsageSnippet language="ruby" operationID="list-subscription-payments" method="get" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}/payments" example="list-payments-200-2" -->
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

req = Models::Operations::ListSubscriptionPaymentsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.subscriptions.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-payments-200-3

<!-- UsageSnippet language="ruby" operationID="list-subscription-payments" method="get" path="/v2/customers/{customerId}/subscriptions/{subscriptionId}/payments" example="list-payments-200-3" -->
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

req = Models::Operations::ListSubscriptionPaymentsRequest.new(
  customer_id: 'cst_5B8cwPMGnU',
  subscription_id: 'sub_5B8cwPMGnU',
  from: 'tr_5B8cwPMGnU',
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.subscriptions.list_payments(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                         | Type                                                                                                              | Required                                                                                                          | Description                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                         | [Models::Operations::ListSubscriptionPaymentsRequest](../../models/operations/listsubscriptionpaymentsrequest.md) | :heavy_check_mark:                                                                                                | The request object to use for the request.                                                                        |

### Response

**[T.nilable(Models::Operations::ListSubscriptionPaymentsResponse)](../../models/operations/listsubscriptionpaymentsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |