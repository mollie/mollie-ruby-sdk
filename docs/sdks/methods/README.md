# Methods

## Overview

### Available Operations

* [list](#list) - List payment methods
* [all](#all) - List all payment methods
* [get](#get) - Get payment method
* [enable](#enable) - Enable payment method
* [disable](#disable) - Disable payment method
* [enable_issuer](#enable_issuer) - Enable payment method issuer
* [disable_issuer](#disable_issuer) - Disable payment method issuer

## list

Retrieve all enabled payment methods. The results of this endpoint are
**not** paginated — unlike most other list endpoints in our API.

For test mode, all pending and enabled payment methods are returned. If no
payment methods are requested yet, the most popular payment methods are returned in the test mode. For live
mode, only fully enabled payment methods are returned.

Payment methods can be requested and enabled via the Mollie Dashboard, or
via the [Enable payment method endpoint](enable-method) of the Profiles API.

The list can optionally be filtered using a number of parameters described
below.

By default, only payment methods for the Euro currency are returned. If you
wish to retrieve payment methods which exclusively support other currencies (e.g. Twint), you need to use the
`amount` parameters.

ℹ️ **Note:** This endpoint only returns **online** payment methods. If you wish to retrieve the information about
a non-online payment method, you can use the [Get payment method endpoint](get-method).

### Example Usage: list-method-200-3

<!-- UsageSnippet language="ruby" operationID="list-methods" method="get" path="/v2/methods" example="list-method-200-3" -->
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

req = Models::Operations::ListMethodsRequest.new(
  sequence_type: Models::Components::SequenceType::ONEOFF,
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  billing_country: 'DE',
  include_wallets: Models::Components::MethodIncludeWalletsParameter::APPLEPAY,
  order_line_categories: Models::Components::LineCategories::ECO,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-methods-200-1

<!-- UsageSnippet language="ruby" operationID="list-methods" method="get" path="/v2/methods" example="list-methods-200-1" -->
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

req = Models::Operations::ListMethodsRequest.new(
  sequence_type: Models::Components::SequenceType::ONEOFF,
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  billing_country: 'DE',
  include_wallets: Models::Components::MethodIncludeWalletsParameter::APPLEPAY,
  order_line_categories: Models::Components::LineCategories::ECO,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-methods-200-2

<!-- UsageSnippet language="ruby" operationID="list-methods" method="get" path="/v2/methods" example="list-methods-200-2" -->
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

req = Models::Operations::ListMethodsRequest.new(
  sequence_type: Models::Components::SequenceType::ONEOFF,
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  billing_country: 'DE',
  include_wallets: Models::Components::MethodIncludeWalletsParameter::APPLEPAY,
  order_line_categories: Models::Components::LineCategories::ECO,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::ListMethodsRequest](../../models/operations/listmethodsrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::ListMethodsResponse)](../../models/operations/listmethodsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## all

Retrieve all payment methods that Mollie offers, regardless of the eligibility of the organization for the specific
method. The results of this endpoint are **not** paginated — unlike most other list endpoints in our API.

The list can optionally be filtered using a number of parameters described below.

ℹ️ **Note:** This endpoint only returns **online** payment methods. If you wish to retrieve the information about
a non-online payment method, you can use the [Get payment method endpoint](get-method).

### Example Usage: list-all-methods-200-1

<!-- UsageSnippet language="ruby" operationID="list-all-methods" method="get" path="/v2/methods/all" example="list-all-methods-200-1" -->
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

req = Models::Operations::ListAllMethodsRequest.new(
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  sequence_type: Models::Components::SequenceType::ONEOFF,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.all(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-all-methods-200-2

<!-- UsageSnippet language="ruby" operationID="list-all-methods" method="get" path="/v2/methods/all" example="list-all-methods-200-2" -->
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

req = Models::Operations::ListAllMethodsRequest.new(
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  sequence_type: Models::Components::SequenceType::ONEOFF,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.all(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-all-methods-200-3

<!-- UsageSnippet language="ruby" operationID="list-all-methods" method="get" path="/v2/methods/all" example="list-all-methods-200-3" -->
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

req = Models::Operations::ListAllMethodsRequest.new(
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  sequence_type: Models::Components::SequenceType::ONEOFF,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.all(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-all-methods-200-4

<!-- UsageSnippet language="ruby" operationID="list-all-methods" method="get" path="/v2/methods/all" example="list-all-methods-200-4" -->
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

req = Models::Operations::ListAllMethodsRequest.new(
  locale: Models::Components::Locale::EN_US,
  amount: Models::Components::Amount.new(
    currency: 'EUR',
    value: '10.00'
  ),
  sequence_type: Models::Components::SequenceType::ONEOFF,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.all(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request`                                                                                     | [Models::Operations::ListAllMethodsRequest](../../models/operations/listallmethodsrequest.md) | :heavy_check_mark:                                                                            | The request object to use for the request.                                                    |

### Response

**[T.nilable(Models::Operations::ListAllMethodsResponse)](../../models/operations/listallmethodsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

Retrieve a single payment method by its ID.

If a method is not available on this profile, a `404 Not Found` response is
returned. If the method is available but not enabled yet, a status `403 Forbidden` is returned. You can enable
payments methods via the [Enable payment method endpoint](enable-method) of the Profiles API, or via
the Mollie Dashboard.

If you do not know the method's ID, you can use the [methods list
endpoint](list-methods) to retrieve all payment methods that are available.

Additionally, it is possible to check if wallet methods such as Apple Pay
are enabled by passing the wallet ID (`applepay`) as the method ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-method" method="get" path="/v2/methods/{methodId}" example="get-method-200-1" -->
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

req = Models::Operations::GetMethodRequest.new(
  method_id: Models::Components::MethodEnum::IDEAL,
  locale: Models::Components::Locale::EN_US,
  currency: 'EUR',
  sequence_type: Models::Components::SequenceType::ONEOFF,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.methods.get(request: req)

unless res.entity_method_get.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                           | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `request`                                                                           | [Models::Operations::GetMethodRequest](../../models/operations/getmethodrequest.md) | :heavy_check_mark:                                                                  | The request object to use for the request.                                          |

### Response

**[T.nilable(Models::Operations::GetMethodResponse)](../../models/operations/getmethodresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## enable

Enable a payment method on a specific profile.

When using a profile-specific API credential, the alias `me` can be used
instead of the profile ID to refer to the current profile.

Some payment methods require extra steps in order to be activated. In cases
where a step at the payment method provider needs to be completed first, the status will be set to
`pending-external` and the response will contain a link to complete the activation at the provider.

To enable voucher or gift card issuers, refer to the [Enable payment method issuer](enable-method-issuer) endpoint.

### Example Usage: enable-method-200-1

<!-- UsageSnippet language="ruby" operationID="enable-method" method="post" path="/v2/profiles/{profileId}/methods/{methodId}" example="enable-method-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.methods.enable(profile_id: 'pfl_5B8cwPMGnU', method_id: Models::Components::MethodEnum::IDEAL, idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_method_get.nil?
  # handle response
end

```
### Example Usage: enable-method-200-2

<!-- UsageSnippet language="ruby" operationID="enable-method" method="post" path="/v2/profiles/{profileId}/methods/{methodId}" example="enable-method-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.methods.enable(profile_id: 'pfl_5B8cwPMGnU', method_id: Models::Components::MethodEnum::IDEAL, idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_method_get.nil?
  # handle response
end

```
### Example Usage: enable-method-200-3

<!-- UsageSnippet language="ruby" operationID="enable-method" method="post" path="/v2/profiles/{profileId}/methods/{methodId}" example="enable-method-200-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.methods.enable(profile_id: 'pfl_5B8cwPMGnU', method_id: Models::Components::MethodEnum::IDEAL, idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_method_get.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `profile_id`                                                                     | *::String*                                                                       | :heavy_check_mark:                                                               | Provide the ID of the related profile.                                           | pfl_5B8cwPMGnU                                                                   |
| `method_id`                                                                      | [T.nilable(Models::Components::MethodEnum)](../../models/shared/methodenum.md)   | :heavy_check_mark:                                                               | Provide the ID of the related payment method.                                    | ideal                                                                            |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::EnableMethodResponse)](../../models/operations/enablemethodresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## disable

Disable a payment method on a specific profile.

When using a profile-specific API credential, the alias `me` can be used
instead of the profile ID to refer to the current profile.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="disable-method" method="delete" path="/v2/profiles/{profileId}/methods/{methodId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.methods.disable(profile_id: 'pfl_5B8cwPMGnU', method_id: Models::Components::MethodEnum::IDEAL, idempotency_key: '123e4567-e89b-12d3-a456-426')

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `profile_id`                                                                     | *::String*                                                                       | :heavy_check_mark:                                                               | Provide the ID of the related profile.                                           | pfl_5B8cwPMGnU                                                                   |
| `method_id`                                                                      | [T.nilable(Models::Components::MethodEnum)](../../models/shared/methodenum.md)   | :heavy_check_mark:                                                               | Provide the ID of the related payment method.                                    | ideal                                                                            |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::DisableMethodResponse)](../../models/operations/disablemethodresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## enable_issuer

Enable an issuer for a payment method on a specific profile.

Currently only the payment methods `voucher` and `giftcard` are supported.

When using a profile-specific API credential, the alias `me` can be used instead of the profile ID to refer to the
current profile.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="enable-method-issuer" method="post" path="/v2/profiles/{profileId}/methods/{methodId}/issuers/{issuerId}" example="enable-method-issuer-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::EnableMethodIssuerRequest.new(
  profile_id: 'pfl_5B8cwPMGnU',
  method_id: Models::Components::MethodIdWithIssuer::VOUCHER,
  issuer_id: 'edenred-france-sports',
  idempotency_key: '123e4567-e89b-12d3-a456-426',
  body: Models::Operations::EnableMethodIssuerRequestBody.new(
    contract_id: 'ideal'
  )
)
res = s.methods.enable_issuer(request: req)

unless res.one_of.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `request`                                                                                             | [Models::Operations::EnableMethodIssuerRequest](../../models/operations/enablemethodissuerrequest.md) | :heavy_check_mark:                                                                                    | The request object to use for the request.                                                            |

### Response

**[T.nilable(Models::Operations::EnableMethodIssuerResponse)](../../models/operations/enablemethodissuerresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## disable_issuer

Disable an issuer for a payment method on a specific profile.

Currently only the payment methods `voucher` and `giftcard` are supported.

When using a profile-specific API credential, the alias `me` can be used instead of the profile ID to refer to the
current profile.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="disable-method-issuer" method="delete" path="/v2/profiles/{profileId}/methods/{methodId}/issuers/{issuerId}" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.methods.disable_issuer(profile_id: 'pfl_5B8cwPMGnU', method_id: Models::Components::MethodIdWithIssuer::VOUCHER, issuer_id: 'edenred-france-sports', idempotency_key: '123e4567-e89b-12d3-a456-426')

if res.status_code == 200
  # handle response
end

```

### Parameters

| Parameter                                                                           | Type                                                                                | Required                                                                            | Description                                                                         | Example                                                                             |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `profile_id`                                                                        | *::String*                                                                          | :heavy_check_mark:                                                                  | Provide the ID of the related profile.                                              | pfl_5B8cwPMGnU                                                                      |
| `method_id`                                                                         | [Models::Components::MethodIdWithIssuer](../../models/shared/methodidwithissuer.md) | :heavy_check_mark:                                                                  | Provide the ID of the related payment method.                                       | voucher                                                                             |
| `issuer_id`                                                                         | *::String*                                                                          | :heavy_check_mark:                                                                  | Provide the ID of the related issuer.                                               | edenred-france-sports                                                               |
| `idempotency_key`                                                                   | *T.nilable(::String)*                                                               | :heavy_minus_sign:                                                                  | A unique key to ensure idempotent requests. This key should be a UUID v4 string.    | 123e4567-e89b-12d3-a456-426                                                         |

### Response

**[T.nilable(Models::Operations::DisableMethodIssuerResponse)](../../models/operations/disablemethodissuerresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |