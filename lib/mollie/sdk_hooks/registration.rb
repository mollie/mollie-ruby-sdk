# typed: true
# frozen_string_literal: true

#
# This file is only ever generated once on the first generation and then is free to be modified.
# Any hooks you wish to add should be registered in the init_hooks method.
#
# Hooks are registered per SDK instance, and are valid for the lifetime of the SDK instance.
#

require_relative "./types"
require_relative "./mollie_hooks"

module Mollie
  module SDKHooks
    class Registration
      extend T::Sig

      sig do
        params(
          hooks: Hooks
        )
          .void
      end
      def self.init_hooks(hooks)
        mollie_hooks = MollieHooks.new

        hooks.register_before_request_hook mollie_hooks
      end
    end
  end
end
