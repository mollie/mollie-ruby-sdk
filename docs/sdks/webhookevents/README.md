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

req = Models::Operations::GetWebhookEventRequest.new(
  webhook_event_id: 'event_1234567890',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  x_client_signature: 'MEUCIQDx8sJvK3z...',
  x_client_signed_at: '2025-01-01T12:00:00Z'
)
res = s.webhook_events.get(request: req)

unless res.entity_webhook_event.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::GetWebhookEventRequest](../../models/operations/getwebhookeventrequest.md) | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |

### Response

**[T.nilable(Models::Operations::GetWebhookEventResponse)](../../models/operations/getwebhookeventresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |