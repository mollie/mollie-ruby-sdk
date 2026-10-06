# typed: true
# frozen_string_literal: true

require "securerandom"
require "json"
require "uri"

require_relative "./types"
require_relative "./global_usage"
require_relative "./mollie_auth_utils"

module Mollie
  module SDKHooks
    class MollieHooks < AbstractSDKHook
      extend T::Sig

      GLOBAL_FIELD_WIRE_NAMES = T.let(
        { profile_id: "profileId", testmode: "testmode" }.freeze,
        T::Hash[Symbol, String]
      )

      sig do
        override
          .params(
            hook_ctx: BeforeRequestHookContext,
            request: Faraday::Request
          )
          .returns(Faraday::Request)
      end
      def before_request(hook_ctx:, request:)
        validate_path_parameters(request)
        handle_idempotency_key(request)
        customize_user_agent(request, hook_ctx)

        security = hook_ctx.security_source&.call
        inject_global_fields(request, hook_ctx) if MollieAuthUtils.client_can_have_global_fields?(security)

        request
      end

      private

      sig { params(request: Faraday::Request).void }
      def validate_path_parameters(request)
        path = T.must(URI.parse(request.path.to_s).path)
        segments = path.split("/", -1)

        segments.each_with_index do |segment, index|
          next if index.zero? && segment.empty?

          next unless segment.nil? || segment.strip.empty?

          Kernel.raise StandardError,
                       "Invalid request: empty path parameter detected in [#{request.http_method.to_s.upcase}] '#{path}'"
        end
      end

      sig { params(request: Faraday::Request).void }
      def handle_idempotency_key(request)
        existing = request.headers["Idempotency-Key"]
        return if existing && !existing.to_s.empty?

        request.headers["Idempotency-Key"] = SecureRandom.uuid
      end

      sig { params(request: Faraday::Request, hook_ctx: BeforeRequestHookContext).void }
      def customize_user_agent(request, hook_ctx)
        config = hook_ctx.config
        custom_user_agent = config.globals.dig(:parameters, :header, :custom_user_agent)
        package_name = config.user_agent.to_s.split(" ").last

        mollie_user_agent = "Speakeasy/#{config.gen_version} Ruby/#{RUBY_VERSION} #{package_name}/#{config.sdk_version}"
        mollie_user_agent = "#{mollie_user_agent} #{custom_user_agent}" if custom_user_agent && !custom_user_agent.to_s.empty?

        request.headers["User-Agent"] = mollie_user_agent
      end

      sig { params(request: Faraday::Request, hook_ctx: BeforeRequestHookContext).void }
      def inject_global_fields(request, hook_ctx)
        operation_id = hook_ctx.operation_id
        config = hook_ctx.config

        field_values = {
          profile_id: config.globals.dig(:parameters, :queryParam, :profile_id),
          testmode: config.globals.dig(:parameters, :queryParam, :testmode)
        }

        fields_to_inject = {}
        GLOBAL_USAGE.each do |field, operations|
          next unless operations.include?(operation_id)

          value = field_values[field]
          next if value.nil?

          fields_to_inject[GLOBAL_FIELD_WIRE_NAMES.fetch(field, field.to_s)] = value
        end

        return if fields_to_inject.empty?

        body = request.body
        return if body.nil? || body.to_s.empty?

        begin
          parsed_body = JSON.parse(T.cast(body, String))
        rescue JSON::ParserError
          return
        end
        return unless parsed_body.is_a?(Hash)

        fields_to_inject.each do |key, value|
          parsed_body[key] = value unless parsed_body.key?(key)
        end

        request.body = JSON.generate(parsed_body)
      end
    end
  end
end
