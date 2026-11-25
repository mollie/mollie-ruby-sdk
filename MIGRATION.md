# Migrating from `mollie-api-ruby` to `mollie-ruby-sdk`

This guide covers migrating from the legacy community Ruby client (`mollie-api-ruby`, the ActiveResource-style gem) to the official Speakeasy-generated Ruby SDK (`mollie-ruby-sdk`).

## Table of contents

- [Why migrate?](#why-migrate)
- [Installation](#installation)
- [Client initialization](#client-initialization)
- [Authentication](#authentication)
- [Resources and methods](#resources-and-methods)
- [Request parameters](#request-parameters)
- [Pagination and listing resources](#pagination-and-listing-resources)
- [Error handling](#error-handling)
- [New features](#new-features)
- [Full resource mapping](#full-resource-mapping)

---

## Why migrate?

Mollie is working towards fully migrating to the new, **automatically generated SDKs**. Unlike the legacy gem, which is updated and typed by hand, `mollie-ruby-sdk` is generated directly from Mollie's API specification, so new features and API updates become available shortly after they are released.

Beyond staying up to date automatically, `mollie-ruby-sdk` also provides:

- Complete API coverage, including Webhooks, Webhook Events, Checkout Sessions, Sales Invoices, Payouts, Transfers, Draft Transfers, Delayed Routing, and Business Accounts.
- Sorbet type signatures (`sig { ... }`) on every public method and model, instead of the legacy gem's untyped `attr_accessor`s.
- Built-in retry logic with configurable backoff, per call or per client.
- Native webhook signature validation, no more hand-rolled HMAC checks.
- `profile_id` and `testmode` available as global client options for organization-level credentials.
- Native OAuth token exchange (`oauth.generate` / `oauth.revoke`), no external OAuth gem required.
- Idempotency keys as a first-class parameter on every mutating call, generated automatically if you don't supply one.

---

## Installation

Remove the old gem and add the new one.

```
# Gemfile
-gem "mollie-api-ruby"
+gem "mollie-ruby-sdk"
```

```
bundle remove mollie-api-ruby
bundle add mollie-ruby-sdk
```

The require path uses underscores, not the gem name's hyphens:

```ruby
-require "mollie-api-ruby"
+require "mollie_ruby_sdk"
```

`mollie-ruby-sdk` requires Ruby **3.2 or later** (the legacy gem only required Ruby 2.5+), and is licensed under Apache-2.0 instead of the legacy gem's BSD license. It also swaps the legacy gem's bundled `Net::HTTP` client for `Faraday` (plus `faraday-multipart` and `faraday-retry`) and adds a runtime dependency on `sorbet-runtime` for its type signatures. Check your Ruby version before migrating, `mollie-ruby-sdk` will not install on Ruby 3.1 or earlier.

---

## Client initialization

The legacy gem configures a process-wide singleton via `Mollie::Client.configure`. The new SDK instantiates an explicit client object, similar in spirit but without the thread-local global state.

**Before:**

```ruby
require "mollie-api-ruby"

Mollie::Client.configure do |config|
  config.api_key = "test_..."
end

payment = Mollie::Payment.get("tr_WDqYK6vllg")
```

**After:**

```ruby
require "mollie_ruby_sdk"

Models = ::Mollie::Models
client = ::Mollie::Client.new(
  security: Models::Components::Security.new(api_key: "test_...")
)

res = client.payments.get(request: Models::Operations::GetPaymentRequest.new(payment_id: "tr_WDqYK6vllg"))
res.payment_response
```

There is no replacement for `Mollie::Client.instance`, `Mollie::Client.with_api_key`, or the `Thread.current['MOLLIE_CLIENT']` singleton. Hold on to your own `Mollie::Client` instance(s) instead (for example, one per API key, or memoized on your application's request context).

```ruby
-Mollie::Client.with_api_key("test_...") do
-  Mollie::Payment.create(...)
-end
+client = ::Mollie::Client.new(security: Models::Components::Security.new(api_key: "test_..."))
+client.payments.create(request: Models::Operations::CreatePaymentRequest.new(body: ...))
```

---

## Authentication

### API key

```ruby
-Mollie::Client.configure { |c| c.api_key = "test_..." }
+client = ::Mollie::Client.new(security: Models::Components::Security.new(api_key: "test_..."))
```

### Access tokens (Connect / organization-level credentials)

The legacy gem has no distinct concept for OAuth/organization-level tokens, any token (API key or OAuth access token) is passed as `api_key` and sent as `Authorization: Bearer <token>`. The new SDK has dedicated security schemes:

```ruby
client = ::Mollie::Client.new(
  security: Models::Components::Security.new(advanced_access_token: "access_...")
)
```

```ruby
client = ::Mollie::Client.new(
  security: Models::Components::Security.new(o_auth: "Bearer eyJ...")
)
```

### Global defaults (`profile_id`, `testmode`)

In the legacy gem, `profileId`/`testmode` were not first-class client options, you passed them by hand as part of the options/data hash on every call, and the client happily camelized and forwarded whatever keys you gave it.

In the new SDK, `profile_id` and `testmode` are configured once on the client:

```ruby
client = ::Mollie::Client.new(
  security: Models::Components::Security.new(advanced_access_token: "access_..."),
  profile_id: "pfl_...",
  testmode: true
)
```

The SDK automatically adds `profileId`/`testmode` to the body of every mutating operation that supports them, but only while the configured credential looks like an organization-level token (one starting with `access_`, the shape used by `advanced_access_token` and `o_auth`). If you configure a plain API key, the values are simply not injected rather than raising an error, so double-check your requests (or use an access token) if you rely on these globals.

Both can still be overridden per request (see [Request parameters](#request-parameters)).

---

## Resources and methods

### No more ActiveResource-style class methods

The legacy gem modeled every resource as a class inheriting from `Mollie::Base`, with class-level `create`/`get`/`all`/`update`/`delete` methods and a process-wide client:

```ruby
payment = Mollie::Payment.create(
  amount: { value: "10.00", currency: "EUR" },
  description: "Order #478",
  redirect_url: "https://example.com/redirect"
)
```

The new SDK exposes resources as instance methods off the `Client` object you create, mirroring the structure of the API itself. Request bodies are typed `Models::Components::*Request` objects (e.g. `PaymentRequest`, `MandateRequest`), not plain hashes, though the SDK also accepts a plain `Hash` wherever a typed model is expected:

```ruby
res = client.payments.create(
  request: Models::Operations::CreatePaymentRequest.new(
    body: Models::Components::PaymentRequest.new(
      amount: Models::Components::Amount.new(currency: "EUR", value: "10.00"),
      description: "Order #478",
      redirect_url: "https://example.com/redirect"
    )
  )
)
res.payment_response
```

Enum-like fields (`locale`, `method`, `sequence_type`, payment status, etc.) are Sorbet enum classes under `Models::Components` (e.g. `Models::Components::SequenceType::ONEOFF`) instead of plain strings or the legacy gem's string constants (`Mollie::Payment::STATUS_PAID`).

### Parameter passing: a `request:` object for almost everything

Unlike the legacy gem's flat argument lists, `mollie-ruby-sdk` bundles every path parameter, query parameter, header, and the request body into a single typed `Models::Operations::<Operation>Request` object, passed as the `request:` keyword argument:

```ruby
client.customers.get(request: Models::Operations::GetCustomerRequest.new(customer_id: "cst_..."))
client.customers.update(request: Models::Operations::UpdateCustomerRequest.new(customer_id: "cst_...", body: ...))
client.mandates.revoke(request: Models::Operations::RevokeMandateRequest.new(customer_id: "cst_...", mandate_id: "mdt_..."))
client.payments.list(request: Models::Operations::ListPaymentsRequest.new(limit: 50))
```

The only exception is a handful of top-level `create` operations that have no path parameter and no query string at all (just a body and optional idempotency/signing headers): `customers.create`, `webhooks.create`, `accounts.create_account`, `wallets.request_apple_pay_session`, and `oauth.generate`/`oauth.revoke`. These accept `body:`, `idempotency_key:`, and the signature headers directly as keyword arguments instead of a wrapped `request:` object:

```ruby
client.customers.create(body: Models::Components::EntityCustomer.new(name: "Customer A"))
```

Check the signature in `docs/sdks/<resource>/README.md` for every method you call rather than assuming one style.

### Nested resources

Both gems group nested resources (mandates, subscriptions, refunds, etc.) under their own top-level accessor rather than under the parent resource, so this part of the mental model carries over from the legacy gem's separate binders (`client.customerMandates`-equivalent is just `Mollie::Customer::Mandate` in the legacy Ruby gem). What changes is the call shape:

| Legacy (`Mollie::`) | New (`client.`) |
| --- | --- |
| `Customer::Mandate.create(customer_id:, ...)` | `mandates.create(request: CreateMandateRequest.new(customer_id:, body: ...))` |
| `Customer::Mandate.get(mandate_id, customer_id:)` | `mandates.get(request: GetMandateRequest.new(customer_id:, mandate_id:))` |
| `Customer::Mandate.all(customer_id:)` | `mandates.list(request: ListMandatesRequest.new(customer_id: ...))` |
| `Customer::Mandate.delete(mandate_id, customer_id:)` (aliased `cancel`) | `mandates.revoke(request: RevokeMandateRequest.new(customer_id:, mandate_id:))` |
| `Customer::Payment.all(customer_id:)` | `customers.list_payments(request: ListCustomerPaymentsRequest.new(customer_id: ...))` |
| `Customer::Subscription.all(customer_id:)` | `subscriptions.list(request: ListSubscriptionsRequest.new(customer_id: ...))` |
| `Payment::Refund.all(payment_id:)` | `refunds.list(request: ListRefundsRequest.new(payment_id: ...))` |
| `Payment::Chargeback.all(payment_id:)` | `chargebacks.list(request: ListChargebacksRequest.new(payment_id: ...))` |
| `Payment::Capture.all(payment_id:)` | `captures.list(request: ListCapturesRequest.new(payment_id: ...))` |
| `Settlement::Payment.all(settlement_id:)` | `settlements.list_payments(request: ListSettlementPaymentsRequest.new(settlement_id: ...))` |
| `Settlement::Refund.all(settlement_id:)` | `settlements.list_refunds(request: ...)` |
| `Settlement::Capture.all(settlement_id:)` | `settlements.list_captures(request: ...)` |
| `Settlement::Chargeback.all(settlement_id:)` | `settlements.list_chargebacks(request: ...)` |

Note the `all` method name collision: in the legacy gem, `.all` means "list every item of this resource for its parent" (the normal list operation). In the new SDK, `all` is a **different, non-nested endpoint** that lists a resource across your *entire account* rather than for one parent, e.g. `chargebacks.list(request:)` needs a `payment_id` and lists chargebacks for that one payment, while `chargebacks.all(request:)` lists every chargeback across all your payments. The same distinction applies to `methods.list`/`methods.all`, `refunds.list`/`refunds.all`, and `subscriptions.list`/`subscriptions.all`. Map your old `.all(parent_id: ...)` calls to the new `list` method, not to `all`.

### Instance relationship helpers are gone

The legacy gem's model instances exposed convenience methods that lazily fetched related resources, e.g.:

```ruby
payment = Mollie::Payment.get("tr_...")
payment.refunds        # => Mollie::Payment::Refund.all(payment_id: payment.id)
payment.customer        # => Mollie::Customer.get(payment.customer_id)
payment.checkout_url     # => extracted from _links
payment.paid?            # => status == "paid"
payment.refund!(amount: ...)
```

Response objects in the new SDK are plain typed data with no behavior and no automatic traversal of `_links`/`_embedded`. Every operation response is wrapped in a `Models::Operations::<Operation>Response` object exposing `status_code`, `content_type`, `raw_response` (the raw `Faraday::Response`), and a resource-specific accessor for the parsed body (e.g. `payment_response`, `customer_response`, or `object` for list endpoints), check each method's response type for the exact accessor name. Replace the legacy helpers with explicit calls, reading IDs and links off the response yourself:

```ruby
payment = client.payments.get(request: Models::Operations::GetPaymentRequest.new(payment_id: "tr_...")).payment_response
payment.status == Models::Components::PaymentResponseStatus::PAID
client.refunds.list(request: Models::Operations::ListRefundsRequest.new(payment_id: payment.id))
```

To embed related resources in a single response instead of making extra calls, use the `include`/`embed` query parameters many `get`/`list` operations accept (e.g. `include: "details.qrCode"`), instead of relying on a model method.

---

## Request parameters

### Idempotency key

The legacy gem accepted `idempotency_key` as a magic key inside the data/options hash, which it stripped out and sent as the `Idempotency-Key` header (POST requests only). The new SDK exposes it as an explicit, documented field on the request object for every operation that mutates state, and generates one automatically with `SecureRandom.uuid` if you don't supply one:

```ruby
client.payments.create(
  request: Models::Operations::CreatePaymentRequest.new(
    body: ...,
    idempotency_key: "123e4567-e89b-12d3-a456-426614174000"
  )
)
```

### `testmode` and `profile_id` per request

These can be set on the client (see [Global defaults](#global-defaults-profile_id-testmode)) and overridden per call on operations whose request object supports them:

```ruby
client.customers.get(request: Models::Operations::GetCustomerRequest.new(customer_id: "cst_...", testmode: false))
```

---

## Pagination and listing resources

### Legacy gem — `Mollie::List`, bidirectional

`.all` returned a `Mollie::List`, an `Enumerable` wrapping the current page's items, with `next`/`previous` methods that fetch adjacent pages:

```ruby
payments = Mollie::Payment.all
payments.each { |p| ... }

next_page = payments.next
previous_page = payments.previous
```

### New SDK — forward-only, via a `next_page` proc

`list`/`all` operations return a response object whose `object` field holds the current page body, and whose `next_page` is a `Proc` you call to fetch the following page (or `nil` if there isn't one). The response also implements `each`, which walks forward through every page automatically:

```ruby
req = Models::Operations::ListPaymentsRequest.new(limit: 50)
res = client.payments.list(request: req)

res.each do |page|
  page.object&.embedded&.payments&.each { |payment| puts payment.id }
end
```

To fetch just the next page manually instead of iterating to the end:

```ruby
next_response = res.next_page&.call
```

There is no `previous` equivalent in the new SDK, only forward pagination via `next_page`.

---

## Error handling

### Legacy gem

```ruby
begin
  Mollie::Payment.get("invalid")
rescue Mollie::ResourceNotFoundError => e
  e.status   # HTTP status
  e.title
  e.detail
  e.field
rescue Mollie::RequestError => e
  # any other 4xx/5xx
rescue Mollie::Exception => e
  # connection-level errors (timeouts, etc.)
end
```

### New SDK

Two exception types to catch, both raised as Ruby exceptions (not returned as error values):

```ruby
begin
  client.payments.get(request: Models::Operations::GetPaymentRequest.new(payment_id: "invalid"))
rescue Mollie::Models::Errors::ErrorResponse => e
  e.status    # HTTP status code
  e.title     # HTTP reason phrase
  e.detail    # human-readable message
  e.field     # offending field, if any
  e.links     # _links from the API response
rescue Mollie::Models::Errors::APIError => e
  # Raised when the API returns an error Mollie didn't document for this
  # operation, or a non-JSON error body (e.g. a gateway timeout page).
  e.status_code
  e.body
  e.raw_response  # the underlying Faraday::Response
end
```

Which status codes raise `ErrorResponse` vs. fall through to `APIError` is documented per operation in `docs/sdks/<resource>/README.md` under "Errors", it varies by endpoint (e.g. `mandates.create` documents `404, 429`; `customers.create_payment` documents `422, 429, 503`).

---

## New features

### Webhook signature validation

The legacy gem has no webhook helper at all, verifying a webhook payload meant writing your own HMAC check. The new SDK ships one:

```ruby
require "mollie_ruby_sdk"

begin
  Mollie::Utils::Webhooks::SignatureValidator.validate(
    raw_request_body,
    ENV["MOLLIE_WEBHOOK_SECRET"],
    request.headers["X-Mollie-Signature"]
  )
rescue Mollie::Utils::Webhooks::InvalidSignatureException
  # reject the request
end
```

`signing_secrets` accepts either a single secret or an array (useful during secret rotation), and `signatures` accepts either a single header value or an array. The call returns `false` if no signature was supplied at all, and raises `InvalidSignatureException` if a signature was supplied but none of the configured secrets match it.

### Native OAuth token exchange

The legacy gem's README points integrators at the third-party `rack-oauth2` gem to exchange authorization codes for tokens. The new SDK does this natively:

```ruby
res = client.oauth.generate(
  security: Models::Operations::OauthGenerateTokensSecurity.new(
    username: client_id,
    password: client_secret
  ),
  body: Models::Operations::OauthGenerateTokensRequestBody.new(
    grant_type: Models::Components::OauthGrantType::AUTHORIZATION_CODE,
    code: "auth_...",
    redirect_uri: "https://example.com/redirect"
  )
)
```

`client.oauth.revoke` is available too. You will still need your own redirect to Mollie's `/oauth2/authorize` endpoint to obtain the authorization code; only the token exchange itself is now built in.

### Manual capture

The legacy gem never documented or shipped an example for creating a capture, only reading one (`get`) or listing them (`list`/`all`). The new SDK explicitly types and documents `client.captures.create(request: Models::Operations::CreateCaptureRequest.new(payment_id:, body: ...))`, for use with payments created via `capture_mode: Models::Components::CaptureMode::MANUAL`.

### Apple Pay payment sessions

New `client.wallets.request_apple_pay_session(body: ...)`, the legacy gem has no equivalent; Apple Pay was only available as a payment `method` value.

### Retries and a custom HTTP client

```ruby
client = ::Mollie::Client.new(
  security: Models::Components::Security.new(api_key: "test_..."),
  retry_config: Mollie::Utils::RetryConfig.new(
    strategy: "backoff",
    backoff: Mollie::Utils::BackoffStrategy.new(
      initial_interval: 500,
      max_interval: 60_000,
      exponent: 1.5,
      max_elapsed_time: 300_000
    ),
    retry_connection_errors: true
  )
)
```

The underlying HTTP client is a `Faraday::Connection` (the legacy gem used `Net::HTTP` directly), which you can also supply yourself via the `client:` keyword argument if you need custom middleware.

---

## Full resource mapping

### Resources available in both gems

| Legacy (`Mollie::`) | New (`client.`) |
| --- | --- |
| `Payment` | `payments` |
| `Payment::Refund` | `refunds` (pass `payment_id`) |
| `Payment::Chargeback` | `chargebacks` (pass `payment_id`) |
| `Payment::Capture` | `captures` (pass `payment_id`) |
| `Refund.all` / `Payment::Refund.all` (no `payment_id`) | `refunds.all` (account-wide) |
| `Payment::Refund.all(payment_id:)` | `refunds.list(request:)` (pass `payment_id`) |
| `Chargeback.all` / `Payment::Chargeback.all` (no `payment_id`) | `chargebacks.all` (account-wide) |
| `Method` | `methods` |
| `Customer` | `customers` |
| `Customer::Payment` | `customers.create_payment` / `customers.list_payments` |
| `Customer::Mandate` | `mandates` (pass `customer_id`) |
| `Customer::Subscription` | `subscriptions` (pass `customer_id`) |
| `Settlement` | `settlements` |
| `Settlement::Payment` | `settlements.list_payments` |
| `Settlement::Refund` | `settlements.list_refunds` |
| `Settlement::Capture` | `settlements.list_captures` |
| `Settlement::Chargeback` | `settlements.list_chargebacks` |
| `Profile` | `profiles` |
| `Organization` | `organizations` |
| `Permission` | `permissions` |
| `Onboarding` | `onboarding` |
| `Terminal` | `terminals` |
| `PaymentLink` | `payment_links` |
| `Invoice` | `invoices` |
| `Balance` | `balances` |
| `Balance::Report` | `balances.get_report` |
| `Balance::Transaction` | `balances.list_transactions` |
| Connect authorize/token exchange (via `rack-oauth2`) | `oauth` |

### Resources available only in the new SDK

| New (`client.`) | Description |
| --- | --- |
| `accounts` | Business account and transaction management |
| `delayed_routing` | Delayed payment routing rules |
| `draft_transfers` | Draft transfer management |
| `payouts` | Payout management |
| `sales_invoices` | Sales invoice management |
| `checkout_sessions` | Checkout sessions |
| `transfers` | Transfer management |
| `balance_transfers` | Connect balance transfers |
| `unmatched_credit_transfers` | Unmatched credit transfer handling |
| `verify_payee` | Payee verification |
| `webhooks` | Webhook management |
| `webhook_events` | Webhook event retrieval |
| `client_links` / `clients` | Mollie Connect client/partner management |
| `capabilities` | Capability checks |
| `wallets` | Apple Pay payment sessions |

### Resources available only in the legacy gem

As of this writing, the following legacy-gem resources have **no equivalent** in `mollie-ruby-sdk`. If your integration relies on them, verify current support before migrating, do not assume they will appear automatically, and re-check the generated SDK's resource list for your Mollie SDK version before cutting over.

| Legacy (`Mollie::`) | Status in `mollie-ruby-sdk` |
| --- | --- |
| `Order`, `Order::Line`, `Order::Payment`, `Order::Refund` | Not available, superseded by [Payment Links](https://docs.mollie.com/reference/v2/payment-links-api/create-payment-link) and standard Payments |
| `Order::Shipment` | Not available |
| `Partner` | Superseded by `organizations.get_partner` |
