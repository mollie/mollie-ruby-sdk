# typed: true
# frozen_string_literal: true

require "openssl"

module Mollie
  module Utils
    module Webhooks
      class InvalidSignatureException < StandardError; end

      class SignatureValidator
        extend T::Sig

        SIGNATURE_HEADER = "X-Mollie-Signature"
        SIGNATURE_PREFIX = "sha256="

        sig { params(signing_secrets: T.any(::String, T::Array[::String])).void }
        def initialize(signing_secrets)
          @signing_secrets = T.let(
            signing_secrets.is_a?(Array) ? signing_secrets.dup : [signing_secrets],
            T::Array[::String]
          )
        end

        sig do
          params(
            payload: ::String,
            signing_secrets: T.any(::String, T::Array[::String]),
            signatures: T.nilable(T.any(::String, T::Array[T.nilable(::String)]))
          )
            .returns(T::Boolean)
        end
        def self.validate(payload, signing_secrets, signatures = nil)
          new(signing_secrets).validate_payload(payload, signatures)
        end

        sig do
          params(
            payload: ::String,
            signatures: T.nilable(T.any(::String, T::Array[T.nilable(::String)]))
          )
            .returns(T::Boolean)
        end
        def validate_payload(payload, signatures = nil)
          signature_list = normalize_signatures(signatures)
          return false if signature_list.empty?

          validate_signatures(payload, signature_list)
        end

        sig { params(payload: ::String, secret: ::String).returns(::String) }
        def self.create_signature(payload, secret)
          OpenSSL::HMAC.hexdigest("SHA256", secret, payload)
        end

        private

        sig do
          params(signatures: T.nilable(T.any(::String, T::Array[T.nilable(::String)])))
            .returns(T::Array[::String])
        end
        def normalize_signatures(signatures)
          case signatures
          when ::String
            signatures.empty? ? [] : [signatures]
          when Array
            signatures.compact.reject(&:empty?)
          else
            []
          end
        end

        sig { params(payload: ::String, signatures: T::Array[::String]).returns(T::Boolean) }
        def validate_signatures(payload, signatures)
          signatures.each do |signature|
            extracted_signature = extract_signature(signature)

            return true if valid_signature?(extracted_signature, payload)
          end

          Kernel.raise InvalidSignatureException, "Invalid webhook signature"
        end

        sig { params(signature_header: ::String).returns(::String) }
        def extract_signature(signature_header)
          if signature_header.start_with?(SIGNATURE_PREFIX)
            T.must(signature_header[SIGNATURE_PREFIX.length..])
          else
            signature_header
          end
        end

        sig { params(provided_signature: ::String, payload: ::String).returns(T::Boolean) }
        def valid_signature?(provided_signature, payload)
          @signing_secrets.any? do |secret|
            expected_signature = self.class.create_signature(payload, secret)
            constant_time_equals(expected_signature, provided_signature)
          end
        end

        sig { params(left: ::String, right: ::String).returns(T::Boolean) }
        def constant_time_equals(left, right)
          max_length = [left.length, right.length].max
          mismatch = left.length ^ right.length

          (0...max_length).each do |index|
            mismatch |= (left.getbyte(index) || 0) ^ (right.getbyte(index) || 0)
          end

          mismatch.zero?
        end
      end
    end
  end
end
