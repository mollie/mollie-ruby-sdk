# typed: true
# frozen_string_literal: true

module Mollie
  module SDKHooks
    module MollieAuthUtils
      extend T::Sig

      # Organization-level credentials (advanced access tokens, OAuth tokens) are prefixed
      # with "access_". Global fields like profile_id/testmode may only be injected into
      # request bodies when such a credential is configured.
      sig { params(security: T.untyped).returns(T::Boolean) }
      def self.client_can_have_global_fields?(security)
        return false if security.nil?

        token = security.api_key || security.advanced_access_token || security.o_auth
        return false if token.nil?

        token.start_with?("access_")
      end

      sig { params(profile_id: T.nilable(::String), testmode: T.nilable(T::Boolean)).returns(T::Boolean) }
      def self.client_has_global_fields?(profile_id, testmode)
        testmode == true || !profile_id.nil?
      end
    end
  end
end
