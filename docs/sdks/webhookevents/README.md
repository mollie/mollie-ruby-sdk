# WebhookEvents

## Overview

### Available Operations

* [get](#get) - Get a Webhook Event

## get

Retrieve a single webhook event object by its event ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-webhook-event" method="get" path="/v2/events/{webhookEventId}" example="get-webhook-event-200" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.webhook_events.get(webhook_event_id: 'event_1234567890', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_webhook_event.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                               | Type                                                                                                                                                                    | Required                                                                                                                                                                | Description                                                                                                                                                             | Example                                                                                                                                                                 |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `webhook_event_id`                                                                                                                                                      | *::String*                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                      | Provide the ID of the related webhook event.                                                                                                                            | event_1234567890                                                                                                                                                        |
| `testmode`                                                                                                                                                              | *T.nilable(T::Boolean)*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                      | You can enable test mode by setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                         |
| `idempotency_key`                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                             |

### Response

**[T.nilable(Models::Operations::GetWebhookEventResponse)](../../models/operations/getwebhookeventresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |