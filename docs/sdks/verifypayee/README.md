# VerifyPayee

## Overview

### Available Operations

* [create](#create) - Verify Payee

## create

> 🚧 Beta feature
>
> This feature is currently in beta testing, and the final specification may still change.

Perform a Verification of Payee (VoP) check. This allows you to verify the account holder name against the
records held by the receiving bank before initiating a transfer.

The verification result indicates whether the provided name matches, closely matches, or does not match the
name on file at the receiving bank. This helps prevent misdirected payments.

### Simulating verification scenarios in test mode

In test mode, you can simulate various verification outcomes by adjusting the creditor name in the
`creditorBankAccount.accountHolderName` property. This allows you to test all possible Verification of Payee
results without needing special properties. The names are case insensitive.

| Account holder name                    | Scenario                                      | Verification result | Suggested name |
|----------------------------------------|-----------------------------------------------|---------------------|----------------|
| `John Close Match`                     | Name closely matches the bank records          | `close-match`       | `John Match`   |
| `John No Match`                        | Name does not match the bank records           | `no-match`          | —              |
| `John Unavailable`                     | Verification is not available                  | `not-available`     | —              |
| Any other name                         | Default: name matches the bank records         | `match`             | —              |

### Example Usage: verify-payee-200-close-match

<!-- UsageSnippet language="ruby" operationID="verify-payee" method="post" path="/v2/business-accounts/payee-verifications" example="verify-payee-200-close-match" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.verify_payee.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::VerificationOfPayeeRequest.new(
  creditor_bank_account: Models::Components::CreditorBankAccount.new(
    account_holder_name: 'Jan Jansen',
    format: Models::Components::AccountNumberFormat::IBAN,
    account_number: 'NL02ABNA0123456789'
  ),
  testmode: false
))

unless res.verification_of_payee_response.nil?
  # handle response
end

```
### Example Usage: verify-payee-200-match

<!-- UsageSnippet language="ruby" operationID="verify-payee" method="post" path="/v2/business-accounts/payee-verifications" example="verify-payee-200-match" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.verify_payee.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::VerificationOfPayeeRequest.new(
  creditor_bank_account: Models::Components::CreditorBankAccount.new(
    account_holder_name: 'Jan Jansen',
    format: Models::Components::AccountNumberFormat::IBAN,
    account_number: 'NL02ABNA0123456789'
  ),
  testmode: false
))

unless res.verification_of_payee_response.nil?
  # handle response
end

```
### Example Usage: verify-payee-200-no-match

<!-- UsageSnippet language="ruby" operationID="verify-payee" method="post" path="/v2/business-accounts/payee-verifications" example="verify-payee-200-no-match" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.verify_payee.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::VerificationOfPayeeRequest.new(
  creditor_bank_account: Models::Components::CreditorBankAccount.new(
    account_holder_name: 'Jan Jansen',
    format: Models::Components::AccountNumberFormat::IBAN,
    account_number: 'NL02ABNA0123456789'
  ),
  testmode: false
))

unless res.verification_of_payee_response.nil?
  # handle response
end

```
### Example Usage: verify-payee-200-not-available

<!-- UsageSnippet language="ruby" operationID="verify-payee" method="post" path="/v2/business-accounts/payee-verifications" example="verify-payee-200-not-available" -->
```ruby
require 'mollie_ruby_sdk'

Models = ::Mollie::Models
s = ::Mollie::Client.new(
  security: Models::Components::Security.new(
    advanced_access_token: '<YOUR_BEARER_TOKEN_HERE>'
  )
)
res = s.verify_payee.create(idempotency_key: '123e4567-e89b-12d3-a456-426', body: Models::Components::VerificationOfPayeeRequest.new(
  creditor_bank_account: Models::Components::CreditorBankAccount.new(
    account_holder_name: 'Jan Jansen',
    format: Models::Components::AccountNumberFormat::IBAN,
    account_number: 'NL02ABNA0123456789'
  ),
  testmode: false
))

unless res.verification_of_payee_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    | Example                                                                                                        |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `idempotency_key`                                                                                              | *T.nilable(::String)*                                                                                          | :heavy_minus_sign:                                                                                             | A unique key to ensure idempotent requests. This key should be a UUID v4 string.                               | 123e4567-e89b-12d3-a456-426                                                                                    |
| `body`                                                                                                         | [T.nilable(Models::Components::VerificationOfPayeeRequest)](../../models/shared/verificationofpayeerequest.md) | :heavy_minus_sign:                                                                                             | N/A                                                                                                            |                                                                                                                |

### Response

**[T.nilable(Models::Operations::VerifyPayeeResponse)](../../models/operations/verifypayeeresponse.md)**

### Errors

| Error Type                    | Status Code                   | Content Type                  |
| ----------------------------- | ----------------------------- | ----------------------------- |
| Models::Errors::ErrorResponse | 422, 429                      | application/hal+json          |
| Models::Errors::ErrorResponse | 503                           | application/hal+json          |
| Errors::APIError              | 4XX, 5XX                      | \*/\*                         |