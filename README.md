# mollie-ruby-sdk

Developer-friendly & type-safe Ruby SDK specifically catered to leverage *mollie-ruby-sdk* API.

[![Built by Speakeasy](https://img.shields.io/badge/Built_by-SPEAKEASY-374151?style=for-the-badge&labelColor=f3f4f6)](https://www.speakeasy.com/?utm_source=mollie-ruby-sdk&utm_campaign=ruby)
[![License: MIT](https://img.shields.io/badge/LICENSE_//_MIT-3b5bdb?style=for-the-badge&labelColor=eff6ff)](https://opensource.org/licenses/MIT)


<br /><br />
> [!IMPORTANT]
> This SDK is not yet ready for production use. To complete setup please follow the steps outlined in your [workspace](https://app.speakeasy.com/org/mollie-oom/mollie). Delete this section before > publishing to a package manager.

<!-- Start Summary [summary] -->
## Summary


<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [mollie-ruby-sdk](#mollie-ruby-sdk)
  * [SDK Installation](#sdk-installation)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Global Parameters](#global-parameters)
  * [Retries](#retries)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

The SDK can be installed using [RubyGems](https://rubygems.org/):

```bash
gem install specific_install
gem specific_install https://github.com/mollie/mollie-ruby-sdk 
```
<!-- End SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new
res = s.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: "",
    password: ""
  ),
  idempotency_key: "123e4567-e89b-12d3-a456-426",
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    refresh_token: "refresh_...",
    redirect_uri: "https://example.com/redirect"
  )
)

unless res.object.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->

<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security schemes globally:

| Name                    | Type   | Scheme       |
| ----------------------- | ------ | ------------ |
| `api_key`               | http   | HTTP Bearer  |
| `advanced_access_token` | http   | HTTP Bearer  |
| `o_auth`                | oauth2 | OAuth2 token |

You can set the security parameters through the `security` optional parameter when initializing the SDK client instance. The selected scheme will be used by default to authenticate with the API for all operations that support it. For example:
```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    api_key: "<YOUR_BEARER_TOKEN_HERE>"
  ),
  testmode: true
)

req = Models::Operations::ListBalancesRequest.new(
  currency: "EUR",
  limit: 50,
  idempotency_key: "123e4567-e89b-12d3-a456-426"
)
res = s.balances.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Per-Operation Security Schemes

Some operations in this SDK require the security scheme to be specified at the request level. For example:
```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new
res = s.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: "",
    password: ""
  ),
  idempotency_key: "123e4567-e89b-12d3-a456-426",
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    refresh_token: "refresh_...",
    redirect_uri: "https://example.com/redirect"
  )
)

unless res.object.nil?
  # handle response
end

```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [Accounts](docs/sdks/accounts/README.md)

* [list_accounts](docs/sdks/accounts/README.md#list_accounts) - List business accounts
* [get_account](docs/sdks/accounts/README.md#get_account) - Get business account
* [list](docs/sdks/accounts/README.md#list) - List transactions
* [get](docs/sdks/accounts/README.md#get) - Get transaction

### [BalanceTransfers](docs/sdks/balancetransfers/README.md)

* [create](docs/sdks/balancetransfers/README.md#create) - Create a Connect balance transfer
* [list](docs/sdks/balancetransfers/README.md#list) - List all Connect balance transfers
* [get](docs/sdks/balancetransfers/README.md#get) - Get a Connect balance transfer

### [Balances](docs/sdks/balances/README.md)

* [list](docs/sdks/balances/README.md#list) - List balances
* [get](docs/sdks/balances/README.md#get) - Get balance
* [get_primary](docs/sdks/balances/README.md#get_primary) - Get primary balance
* [get_report](docs/sdks/balances/README.md#get_report) - Get balance report
* [list_transactions](docs/sdks/balances/README.md#list_transactions) - List balance transactions

### [Capabilities](docs/sdks/capabilities/README.md)

* [list](docs/sdks/capabilities/README.md#list) - List capabilities

### [Captures](docs/sdks/captures/README.md)

* [create](docs/sdks/captures/README.md#create) - Create capture
* [list](docs/sdks/captures/README.md#list) - List captures
* [get](docs/sdks/captures/README.md#get) - Get capture

### [Chargebacks](docs/sdks/chargebacks/README.md)

* [list](docs/sdks/chargebacks/README.md#list) - List payment chargebacks
* [get](docs/sdks/chargebacks/README.md#get) - Get payment chargeback
* [all](docs/sdks/chargebacks/README.md#all) - List all chargebacks

### [CheckoutSessions](docs/sdks/checkoutsessions/README.md)

* [create](docs/sdks/checkoutsessions/README.md#create) - Create Checkout Session
* [get](docs/sdks/checkoutsessions/README.md#get) - Get Checkout Session

### [ClientLinks](docs/sdks/clientlinks/README.md)

* [create](docs/sdks/clientlinks/README.md#create) - Create client link

### [Clients](docs/sdks/clients/README.md)

* [list](docs/sdks/clients/README.md#list) - List clients
* [get](docs/sdks/clients/README.md#get) - Get client

### [Customers](docs/sdks/customers/README.md)

* [create](docs/sdks/customers/README.md#create) - Create customer
* [list](docs/sdks/customers/README.md#list) - List customers
* [get](docs/sdks/customers/README.md#get) - Get customer
* [update](docs/sdks/customers/README.md#update) - Update customer
* [delete](docs/sdks/customers/README.md#delete) - Delete customer
* [create_payment](docs/sdks/customers/README.md#create_payment) - Create customer payment
* [list_payments](docs/sdks/customers/README.md#list_payments) - List customer payments

### [DelayedRouting](docs/sdks/delayedrouting/README.md)

* [create](docs/sdks/delayedrouting/README.md#create) - Create a delayed route
* [list](docs/sdks/delayedrouting/README.md#list) - List payment routes
* [get](docs/sdks/delayedrouting/README.md#get) - Get a delayed route

### [DraftTransfers](docs/sdks/drafttransfers/README.md)

* [create](docs/sdks/drafttransfers/README.md#create) - Create draft transfer
* [list](docs/sdks/drafttransfers/README.md#list) - List draft transfers
* [get](docs/sdks/drafttransfers/README.md#get) - Get draft transfer
* [cancel](docs/sdks/drafttransfers/README.md#cancel) - Cancel draft transfer

### [Invoices](docs/sdks/invoices/README.md)

* [list](docs/sdks/invoices/README.md#list) - List invoices
* [get](docs/sdks/invoices/README.md#get) - Get invoice

### [Mandates](docs/sdks/mandates/README.md)

* [create](docs/sdks/mandates/README.md#create) - Create mandate
* [list](docs/sdks/mandates/README.md#list) - List mandates
* [get](docs/sdks/mandates/README.md#get) - Get mandate
* [revoke](docs/sdks/mandates/README.md#revoke) - Revoke mandate

### [Methods](docs/sdks/methods/README.md)

* [list](docs/sdks/methods/README.md#list) - List payment methods
* [all](docs/sdks/methods/README.md#all) - List all payment methods
* [get](docs/sdks/methods/README.md#get) - Get payment method
* [enable](docs/sdks/methods/README.md#enable) - Enable payment method
* [disable](docs/sdks/methods/README.md#disable) - Disable payment method
* [enable_issuer](docs/sdks/methods/README.md#enable_issuer) - Enable payment method issuer
* [disable_issuer](docs/sdks/methods/README.md#disable_issuer) - Disable payment method issuer

### [Oauth](docs/sdks/oauth/README.md)

* [generate](docs/sdks/oauth/README.md#generate) - Generate tokens
* [revoke](docs/sdks/oauth/README.md#revoke) - Revoke tokens

### [Onboarding](docs/sdks/onboarding/README.md)

* [get](docs/sdks/onboarding/README.md#get) - Get onboarding status
* [submit](docs/sdks/onboarding/README.md#submit) - Submit onboarding data

### [Organizations](docs/sdks/organizations/README.md)

* [get](docs/sdks/organizations/README.md#get) - Get organization
* [get_current](docs/sdks/organizations/README.md#get_current) - Get current organization
* [get_partner](docs/sdks/organizations/README.md#get_partner) - Get partner status

### [PaymentLinks](docs/sdks/paymentlinks/README.md)

* [create](docs/sdks/paymentlinks/README.md#create) - Create payment link
* [list](docs/sdks/paymentlinks/README.md#list) - List payment links
* [get](docs/sdks/paymentlinks/README.md#get) - Get payment link
* [update](docs/sdks/paymentlinks/README.md#update) - Update payment link
* [delete](docs/sdks/paymentlinks/README.md#delete) - Delete payment link
* [list_payments](docs/sdks/paymentlinks/README.md#list_payments) - Get payment link payments

### [Payments](docs/sdks/payments/README.md)

* [create](docs/sdks/payments/README.md#create) - Create payment
* [list](docs/sdks/payments/README.md#list) - List payments
* [get](docs/sdks/payments/README.md#get) - Get payment
* [update](docs/sdks/payments/README.md#update) - Update payment
* [cancel](docs/sdks/payments/README.md#cancel) - Cancel payment
* [release_authorization](docs/sdks/payments/README.md#release_authorization) - Release payment authorization

### [Payouts](docs/sdks/payouts/README.md)

* [create](docs/sdks/payouts/README.md#create) - Create payout
* [list](docs/sdks/payouts/README.md#list) - List payouts
* [get](docs/sdks/payouts/README.md#get) - Get payout
* [cancel](docs/sdks/payouts/README.md#cancel) - Cancel payout

### [Permissions](docs/sdks/permissions/README.md)

* [list](docs/sdks/permissions/README.md#list) - List permissions
* [get](docs/sdks/permissions/README.md#get) - Get permission

### [Profiles](docs/sdks/profiles/README.md)

* [create](docs/sdks/profiles/README.md#create) - Create profile
* [list](docs/sdks/profiles/README.md#list) - List profiles
* [get](docs/sdks/profiles/README.md#get) - Get profile
* [update](docs/sdks/profiles/README.md#update) - Update profile
* [delete](docs/sdks/profiles/README.md#delete) - Delete profile
* [get_current](docs/sdks/profiles/README.md#get_current) - Get current profile

### [Refunds](docs/sdks/refunds/README.md)

* [create](docs/sdks/refunds/README.md#create) - Create payment refund
* [list](docs/sdks/refunds/README.md#list) - List payment refunds
* [get](docs/sdks/refunds/README.md#get) - Get payment refund
* [cancel](docs/sdks/refunds/README.md#cancel) - Cancel payment refund
* [all](docs/sdks/refunds/README.md#all) - List all refunds

### [Reports](docs/sdks/reports/README.md)

* [create](docs/sdks/reports/README.md#create) - Create report
* [get](docs/sdks/reports/README.md#get) - Get report

### [SalesInvoices](docs/sdks/salesinvoices/README.md)

* [create](docs/sdks/salesinvoices/README.md#create) - Create sales invoice
* [list](docs/sdks/salesinvoices/README.md#list) - List sales invoices
* [get](docs/sdks/salesinvoices/README.md#get) - Get sales invoice
* [update](docs/sdks/salesinvoices/README.md#update) - Update sales invoice
* [delete](docs/sdks/salesinvoices/README.md#delete) - Delete sales invoice

### [Settlements](docs/sdks/settlements/README.md)

* [list](docs/sdks/settlements/README.md#list) - List settlements
* [get](docs/sdks/settlements/README.md#get) - Get settlement
* [get_open](docs/sdks/settlements/README.md#get_open) - Get open settlement
* [get_next](docs/sdks/settlements/README.md#get_next) - Get next settlement
* [list_payments](docs/sdks/settlements/README.md#list_payments) - List settlement payments
* [list_captures](docs/sdks/settlements/README.md#list_captures) - List settlement captures
* [list_refunds](docs/sdks/settlements/README.md#list_refunds) - List settlement refunds
* [list_chargebacks](docs/sdks/settlements/README.md#list_chargebacks) - List settlement chargebacks

### [Subscriptions](docs/sdks/subscriptions/README.md)

* [create](docs/sdks/subscriptions/README.md#create) - Create subscription
* [list](docs/sdks/subscriptions/README.md#list) - List customer subscriptions
* [get](docs/sdks/subscriptions/README.md#get) - Get subscription
* [update](docs/sdks/subscriptions/README.md#update) - Update subscription
* [cancel](docs/sdks/subscriptions/README.md#cancel) - Cancel subscription
* [all](docs/sdks/subscriptions/README.md#all) - List all subscriptions
* [list_payments](docs/sdks/subscriptions/README.md#list_payments) - List subscription payments

### [Terminals](docs/sdks/terminals/README.md)

* [list](docs/sdks/terminals/README.md#list) - List terminals
* [get](docs/sdks/terminals/README.md#get) - Get terminal
* [terminals_request_pairing_code](docs/sdks/terminals/README.md#terminals_request_pairing_code) - Request terminal pairing code
* [terminals_list_pairing_codes](docs/sdks/terminals/README.md#terminals_list_pairing_codes) - List terminal pairing codes
* [terminals_get_pairing_code](docs/sdks/terminals/README.md#terminals_get_pairing_code) - Get terminal pairing code
* [terminals_revoke_pairing_code](docs/sdks/terminals/README.md#terminals_revoke_pairing_code) - Revoke terminal pairing code

### [Transfers](docs/sdks/transfers/README.md)

* [create](docs/sdks/transfers/README.md#create) - Create transfer
* [get](docs/sdks/transfers/README.md#get) - Get transfer

### [UnmatchedCreditTransfers](docs/sdks/unmatchedcredittransfers/README.md)

* [list](docs/sdks/unmatchedcredittransfers/README.md#list) - List unmatched credit transfers
* [get](docs/sdks/unmatchedcredittransfers/README.md#get) - Get unmatched credit transfer
* [match](docs/sdks/unmatchedcredittransfers/README.md#match) - Match unmatched credit transfer
* [return](docs/sdks/unmatchedcredittransfers/README.md#return) - Return unmatched credit transfer

### [VerifyPayee](docs/sdks/verifypayee/README.md)

* [create](docs/sdks/verifypayee/README.md#create) - Verify Payee

### [Wallets](docs/sdks/wallets/README.md)

* [request_apple_pay_session](docs/sdks/wallets/README.md#request_apple_pay_session) - Request Apple Pay payment session

### [WebhookEvents](docs/sdks/webhookevents/README.md)

* [get](docs/sdks/webhookevents/README.md#get) - Get a Webhook Event

### [Webhooks](docs/sdks/webhooks/README.md)

* [create](docs/sdks/webhooks/README.md#create) - Create a webhook
* [list](docs/sdks/webhooks/README.md#list) - List all webhooks
* [update](docs/sdks/webhooks/README.md#update) - Update a webhook
* [get](docs/sdks/webhooks/README.md#get) - Get a webhook
* [delete](docs/sdks/webhooks/README.md#delete) - Delete a webhook
* [test](docs/sdks/webhooks/README.md#test) - Test a webhook

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Global Parameters [global-parameters] -->
## Global Parameters

Certain parameters are configured globally. These parameters may be set on the SDK client instance itself during initialization. When configured as an option during SDK initialization, These global values will be used as defaults on the operations that use them. When such operations are called, there is a place in each to override the global value, if needed.

For example, you can set `profileId` to `` at SDK initialization and then you do not have to pass the same value on calls to operations like `list`. But if you want to do so you may, which will locally override the global setting. See the example code below for a demonstration.


### Available Globals

The following global parameters are available.

| Name              | Type       | Description                                                                                                                                                                                                                                                                                                                                                                                              |
| ----------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| profile_id        | ::String   | The identifier referring to the [profile](get-profile) you wish to<br/>retrieve the resources for.<br/><br/>Most API credentials are linked to a single profile. In these cases the `profileId` must not be sent. For<br/>organization-level credentials such as OAuth access tokens however, the `profileId` parameter is required.                                                                     |
| testmode          | T::Boolean | Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query<br/>parameter must not be sent. For organization-level credentials such as OAuth access tokens, you can enable test mode by<br/>setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |
| custom_user_agent | ::String   | Custom user agent string to be appended to the default Mollie SDK user agent.                                                                                                                                                                                                                                                                                                                            |

### Example

```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  profile_id: "<id>",
  custom_user_agent: "<value>",
  security: Models::Components::Security.new(
    advanced_access_token: "<YOUR_BEARER_TOKEN_HERE>"
  )
)

req = Models::Operations::ListBalancesRequest.new(
  currency: "EUR",
  limit: 50,
  idempotency_key: "123e4567-e89b-12d3-a456-426"
)
res = s.balances.list(request: req)

unless res.object.nil?
  # handle response
end

```
<!-- End Global Parameters [global-parameters] -->

<!-- Start Retries [retries] -->
## Retries

Some of the endpoints in this SDK support retries. If you use the SDK without any configuration, it will fall back to the default retry strategy provided by the API. However, the default retry strategy can be overridden on a per-operation basis, or across the entire SDK.

To change the default retry strategy for a single API call, simply provide a `RetryConfig` object to the call:
```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new
res = s.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: "",
    password: ""
  ),
  idempotency_key: "123e4567-e89b-12d3-a456-426",
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    refresh_token: "refresh_...",
    redirect_uri: "https://example.com/redirect"
  )
)

unless res.object.nil?
  # handle response
end

```

If you'd like to override the default retry strategy for all operations that support retries, you can use the `retry_config` optional parameter when initializing the SDK:
```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  retry_config: Utils::RetryConfig.new(
    backoff: Utils::BackoffStrategy.new(
      exponent: 1.1,
      initial_interval: 1,
      max_elapsed_time: 100,
      max_interval: 50
    ),
    retry_connection_errors: false,
    strategy: "backoff"
  )
)
res = s.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: "",
    password: ""
  ),
  idempotency_key: "123e4567-e89b-12d3-a456-426",
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    refresh_token: "refresh_...",
    redirect_uri: "https://example.com/redirect"
  )
)

unless res.object.nil?
  # handle response
end

```
<!-- End Retries [retries] -->

<!-- Start Error Handling [errors] -->
## Error Handling

Handling errors in this SDK should largely match your expectations. All operations return a response object or raise an error.

By default an API error will raise a `Errors::APIError`, which has the following properties:

| Property       | Type                                    | Description           |
|----------------|-----------------------------------------|-----------------------|
| `message`     | *string*                                 | The error message     |
| `status_code`  | *int*                                   | The HTTP status code  |
| `raw_response` | *Faraday::Response*                     | The raw HTTP response |
| `body`        | *string*                                 | The response content  |

When custom error responses are specified for an operation, the SDK may also throw their associated exception. You can refer to respective *Errors* tables in SDK docs for more details on possible exception types for each operation. For example, the `generate` method throws the following exceptions:

| Error Type                    | Status Code | Content Type         |
| ----------------------------- | ----------- | -------------------- |
| Models::Errors::ErrorResponse | 429         | application/hal+json |
| Errors::APIError              | 4XX, 5XX    | \*/\*                |

### Example

```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new

begin
  res = s.oauth.generate(
    security: Models::Operations::OauthGenerateTokensSecurity.new(
      username: "",
      password: ""
    ),
    idempotency_key: "123e4567-e89b-12d3-a456-426",
    body: Models::Operations::OauthGenerateTokensRequestBody.new(
      grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
      code: "auth_...",
      refresh_token: "refresh_...",
      redirect_uri: "https://example.com/redirect"
    )
  )

  unless res.object.nil?
    # handle response
  end

rescue Models::Errors::ErrorResponse => e
  # handle e.container data
  raise e
rescue Errors::APIError => e
  # handle default exception
  raise e
end

```
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Override Server URL Per-Client

The default server can be overridden globally by passing a URL to the `server_url (String)` optional parameter when initializing the SDK client instance. For example:
```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  server_url: "https://api.mollie.com"
)
res = s.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: "",
    password: ""
  ),
  idempotency_key: "123e4567-e89b-12d3-a456-426",
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    refresh_token: "refresh_...",
    redirect_uri: "https://example.com/redirect"
  )
)

unless res.object.nil?
  # handle response
end

```
<!-- End Server Selection [server] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation. 
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release. 

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=mollie-ruby-sdk&utm_campaign=ruby)
