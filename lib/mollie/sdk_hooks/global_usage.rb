# typed: true
# frozen_string_literal: true

module Mollie
  module SDKHooks
    # Maps global fields to the operation IDs that accept them in the request body.
    GLOBAL_USAGE = T.let(
      {
        profile_id: %w[
          create-payment
          release-authorization
          create-session
          request-apple-pay-payment-session
          create-payment-link
          create-customer-payment
          create-subscription
          create-sales-invoice
        ].freeze,
        testmode: %w[
          create-webhook
          update-webhook
          delete-webhook
          test-webhook
          create-connect-balance-transfer
          create-payment
          update-payment
          cancel-payment
          release-authorization
          create-session
          create-refund
          create-payment-link
          update-payment-link
          delete-payment-link
          create-customer
          update-customer
          delete-customer
          create-customer-payment
          create-mandate
          revoke-mandate
          create-subscription
          update-subscription
          cancel-subscription
          create-sales-invoice
          update-sales-invoice
          delete-sales-invoice
          create-transfer
          verify-payee
        ].freeze,
        custom_user_agent: [].freeze
      }.freeze,
      T::Hash[Symbol, T::Array[String]]
    )
  end
end
