# Balances

## Overview

### Available Operations

* [list](#list) - List balances
* [get](#get) - Get balance
* [get_primary](#get_primary) - Get primary balance
* [get_report](#get_report) - Get balance report
* [list_transactions](#list_transactions) - List balance transactions

## list

Retrieve a list of the organization's balances, including the primary balance.

The results are paginated.

### Example Usage: list-balances-200-1

<!-- UsageSnippet language="ruby" operationID="list-balances" method="get" path="/v2/balances" example="list-balances-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListBalancesRequest.new(
  currency: 'EUR',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.list(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-balances-200-2

<!-- UsageSnippet language="ruby" operationID="list-balances" method="get" path="/v2/balances" example="list-balances-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListBalancesRequest.new(
  currency: 'EUR',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::ListBalancesRequest](../../models/operations/listbalancesrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::ListBalancesResponse)](../../models/operations/listbalancesresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get

When processing payments with Mollie, we put all pending funds — usually
minus Mollie fees — on a balance. Once you have linked a bank account to your Mollie account, we can pay out your
balance towards this bank account.

With the Balances API you can retrieve your current balance. The response
includes two amounts:

* The *pending amount*. These are payments that have been marked as `paid`,
but are not yet available on your balance.
* The *available amount*. This is the amount that you can get paid out to
your bank account, or use for refunds.

With instant payment methods like iDEAL, payments are moved to the available
balance instantly. With slower payment methods, like credit card for example, it can take a few days before the
funds are available on your balance. These funds will be shown under the *pending amount* in the meanwhile.

### Example Usage: get-balance-200-1

<!-- UsageSnippet language="ruby" operationID="get-balance" method="get" path="/v2/balances/{balanceId}" example="get-balance-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.balances.get(balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_balance.nil?
  # handle response
end

```
### Example Usage: get-balance-200-2

<!-- UsageSnippet language="ruby" operationID="get-balance" method="get" path="/v2/balances/{balanceId}" example="get-balance-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.balances.get(balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH', idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_balance.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                               | Type                                                                                                                                                                    | Required                                                                                                                                                                | Description                                                                                                                                                             | Example                                                                                                                                                                 |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `balance_id`                                                                                                                                                            | *::String*                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                      | Provide the ID of the related balance.                                                                                                                                  | bal_gVMhHKqSSRYJyPsuoPNFH                                                                                                                                               |
| `testmode`                                                                                                                                                              | *T.nilable(T::Boolean)*                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                      | You can enable test mode by setting the `testmode` query parameter to `true`.<br/><br/>Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa. |                                                                                                                                                                         |
| `idempotency_key`                                                                                                                                                       | *T.nilable(::String)*                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                      | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                                                                                        | 123e4567-e89b-12d3-a456-426                                                                                                                                             |

### Response

**[T.nilable(Models::Operations::GetBalanceResponse)](../../models/operations/getbalanceresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 429                      | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get_primary

Retrieve the primary balance. This is the balance of your account's primary
currency, where all payments are settled to by default.

This endpoint is a convenient alias of the [Get balance](get-balance)
endpoint.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get-primary-balance" method="get" path="/v2/balances/primary" example="get-primary-balance-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.balances.get_primary(idempotency_key: '123e4567-e89b-12d3-a456-426')

unless res.entity_balance.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                        | Type                                                                             | Required                                                                         | Description                                                                      | Example                                                                          |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `idempotency_key`                                                                | *T.nilable(::String)*                                                            | :heavy_minus_sign:                                                               | A unique key to ensure idempotent requests. This key should be a UUID v4 string. | 123e4567-e89b-12d3-a456-426                                                      |

### Response

**[T.nilable(Models::Operations::GetPrimaryBalanceResponse)](../../models/operations/getprimarybalanceresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 429                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## get_report

Retrieve a summarized report for all transactions on a given balance within a given timeframe.

The API also provides a detailed report on all 'prepayments' for Mollie fees that were deducted from your balance
during the reported period, ahead of your Mollie invoice.

The alias `primary` can be used instead of the balance ID to refer to the
organization's primary balance.

### Example Usage: get-balance-report-200-1

<!-- UsageSnippet language="ruby" operationID="get-balance-report" method="get" path="/v2/balances/{balanceId}/report" example="get-balance-report-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetBalanceReportRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  from: '2024-01-01',
  until_: '2024-02-01',
  grouping: Models::Components::BalanceReportGrouping::STATUS_BALANCES,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.get_report(request: req)

unless res.entity_balance_report.nil?
  # handle response
end

```
### Example Usage: get-balance-report-200-2

<!-- UsageSnippet language="ruby" operationID="get-balance-report" method="get" path="/v2/balances/{balanceId}/report" example="get-balance-report-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetBalanceReportRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  from: '2024-01-01',
  until_: '2024-02-01',
  grouping: Models::Components::BalanceReportGrouping::STATUS_BALANCES,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.get_report(request: req)

unless res.entity_balance_report.nil?
  # handle response
end

```
### Example Usage: get-balance-report-200-3

<!-- UsageSnippet language="ruby" operationID="get-balance-report" method="get" path="/v2/balances/{balanceId}/report" example="get-balance-report-200-3" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: false,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::GetBalanceReportRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  from: '2024-01-01',
  until_: '2024-02-01',
  grouping: Models::Components::BalanceReportGrouping::STATUS_BALANCES,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.get_report(request: req)

unless res.entity_balance_report.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `request`                                                                                         | [Models::Operations::GetBalanceReportRequest](../../models/operations/getbalancereportrequest.md) | :heavy_check_mark:                                                                                | The request object to use for the request.                                                        |

### Response

**[T.nilable(Models::Operations::GetBalanceReportResponse)](../../models/operations/getbalancereportresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 404, 422, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |

## list_transactions

Retrieve a list of all balance transactions. Transactions include for
example payments, refunds, chargebacks, and settlements.

For an aggregated report of these balance transactions, refer to the [Get
balance report](get-balance-report) endpoint.

The alias `primary` can be used instead of the balance ID to refer to the
organization's primary balance.

The results are paginated.

### Example Usage: list-balance-transactions-200-1

<!-- UsageSnippet language="ruby" operationID="list-balance-transactions" method="get" path="/v2/balances/{balanceId}/transactions" example="list-balance-transactions-200-1" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListBalanceTransactionsRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.list_transactions(request: req)

unless res.object.nil?
  # handle response
end

```
### Example Usage: list-balance-transactions-200-2

<!-- UsageSnippet language="ruby" operationID="list-balance-transactions" method="get" path="/v2/balances/{balanceId}/transactions" example="list-balance-transactions-200-2" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  testmode: true,
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)

req = Models::Operations::ListBalanceTransactionsRequest.new(
  balance_id: 'bal_gVMhHKqSSRYJyPsuoPNFH',
  limit: 50,
  idempotency_key: '123e4567-e89b-12d3-a456-426'
)
res = s.balances.list_transactions(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                       | Type                                                                                                            | Required                                                                                                        | Description                                                                                                     |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                       | [Models::Operations::ListBalanceTransactionsRequest](../../models/operations/listbalancetransactionsrequest.md) | :heavy_check_mark:                                                                                              | The request object to use for the request.                                                                      |

### Response

**[T.nilable(Models::Operations::ListBalanceTransactionsResponse)](../../models/operations/listbalancetransactionsresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 400, 404, 429                 | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |