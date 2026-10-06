# Webhooks

## Overview

### Available Operations

* [create](#create) - Create a webhook
* [list](#list) - List all webhooks
* [update](#update) - Update a webhook
* [get](#get) - Get a webhook
* [delete](#delete) - Delete a webhook
* [test](#test) - Test a webhook

## create

A webhook must have a name, an url and a list of event types. You can also create webhooks in the webhooks settings section of the Dashboard.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create-webhook" method="post" path="/v2/webhooks" example="create-webhook-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::CreateWebhookRequestBody.new(
  name: 'Webhook #1',
  url: 'https://mollie.com/',
  event_types: Models::Components::WebhookEventTypes::PAYMENT_LINK_PAID,
  testmode: false
))

unless res.create_webhook.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Operations::CreateWebhookRequestBody)](../../models/operations/createwebhookrequestbody.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::CreateWebhookResponse)](../../models/operations/createwebhookresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list

Returns a paginated list of your webhooks. If no webhook endpoints are available, the resulting array will be empty. This request should never throw an error.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="list-webhooks" method="get" path="/v2/webhooks" example="list-webhook-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListWebhooksRequest.new(
  limit: 50,
  sort: Models::Components::Sorting::DESC,
  event_types: Models::Components::WebhookEventTypes::PAYMENT_LINK_PAID,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.webhooks.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::ListWebhooksRequest](../../models/operations/listwebhooksrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::ListWebhooksResponse)](../../models/operations/listwebhooksresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## update

Updates the webhook. You may edit the name, url and the list of subscribed event types.

### Example Usage: get-webhook-200

<!-- UsageSnippet language="ruby" operationID="update-webhook" method="patch" path="/v2/webhooks/{webhookId}" example="get-webhook-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.update(webhook_id: 'hook_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::UpdateWebhookRequestBody.new(
  name: 'Webhook #1',
  url: 'https://mollie.com/',
  event_types: Models::Components::WebhookEventTypes::PAYMENT_LINK_PAID,
  testmode: false
))

unless res.entity_webhook.nil?
  # handle response
end

```
### Example Usage: get-webhook-200-1

<!-- UsageSnippet language="ruby" operationID="update-webhook" method="patch" path="/v2/webhooks/{webhookId}" example="get-webhook-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.update(webhook_id: 'hook_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::UpdateWebhookRequestBody.new(
  name: 'Webhook #1',
  url: 'https://mollie.com/',
  event_types: Models::Components::WebhookEventTypes::PAYMENT_LINK_PAID,
  testmode: false
))

unless res.entity_webhook.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `webhook_id`                                                                                                   | *::String*                                                                                                     | :heavy_check_mark:                                                                                             | Provide the ID of the related webhook.                                                                         | hook_1234567890                                                                                                |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Operations::UpdateWebhookRequestBody)](../../models/operations/updatewebhookrequestbody.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::UpdateWebhookResponse)](../../models/operations/updatewebhookresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single webhook object by its ID.

### Example Usage: get-webhook-200

<!-- UsageSnippet language="ruby" operationID="get-webhook" method="get" path="/v2/webhooks/{webhookId}" example="get-webhook-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.get(webhook_id: 'hook_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_webhook.nil?
  # handle response
end

```
### Example Usage: get-webhook-200-1

<!-- UsageSnippet language="ruby" operationID="get-webhook" method="get" path="/v2/webhooks/{webhookId}" example="get-webhook-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.get(webhook_id: 'hook_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_webhook.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                               | Type                                                                                                                                                                    | Required                                                                                                                                                                | Description                                                                                                                                                             | Example                                                                                                                                                                 |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `webhook_id`                                                                                                                                                            | *::String*                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                      | Provide the ID of the related webhook.                                                                                                                                  | hook_1234567890                                                                                                                                                         |
| `testmode`                                                                                                                                                              | *T.nilable(T::Boolean)*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                      | You can enable test mode by setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                         |
| `idempotency_key`                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                             |

### Response

**[T.nilable(Models::Operations::GetWebhookResponse)](../../models/operations/getwebhookresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## delete

Delete a single webhook object by its webhook ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="delete-webhook" method="delete" path="/v2/webhooks/{webhookId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.delete(webhook_id: 'hook_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::DeleteWebhookRequestBody.new(
  testmode: false
))

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `webhook_id`                                                                                                   | *::String*                                                                                                     | :heavy_check_mark:                                                                                             | Provide the ID of the related webhook.                                                                         | hook_1234567890                                                                                                |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Operations::DeleteWebhookRequestBody)](../../models/operations/deletewebhookrequestbody.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::DeleteWebhookResponse)](../../models/operations/deletewebhookresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## test

Sends a test event to the webhook to verify the endpoint is working as expected.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="test-webhook" method="post" path="/v2/webhooks/{webhookId}/ping" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhooks.test(webhook_id: 'hook_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Operations::TestWebhookRequestBody.new(
  testmode: false
))

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                                                  | Type                                                                                                       | Required                                                                                                   | Description                                                                                                | Example                                                                                                    |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `webhook_id`                                                                                               | *::String*                                                                                                 | :heavy_check_mark:                                                                                         | Provide the ID of the related webhook.                                                                     | hook_1234567890                                                                                            |
| `idempotency_key`                                                                                          | *T.nilable(::String)*                                                                                      | :heavy_minus_sign:                                                                                         | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                           | 123e4567-e89b-12d3-a456-426                                                                                |
| `body`                                                                                                     | [T.nilable(Models::Operations::TestWebhookRequestBody)](../../models/operations/testwebhookrequestbody.md) | :heavy_minus_sign:                                                                                         | N/A                                                                                                        |                                                                                                            |

### Response

**[T.nilable(Models::Operations::TestWebhookResponse)](../../models/operations/testwebhookresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |