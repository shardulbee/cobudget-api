# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Rails::Conductor::ActionMailbox::InboundEmailsController`.
# Please instead update this file by running `bin/tapioca dsl Rails::Conductor::ActionMailbox::InboundEmailsController`.

# typed: strict
module Rails
  module Conductor
    module ActionMailbox
      class InboundEmailsController
        module HelperMethods
          include ::ActionText::ContentHelper
          include ::ActionText::TagHelper

          sig { returns(T.untyped) }
          def alert; end

          sig { params(key: T.untyped).returns(T.untyped) }
          def combined_fragment_cache_key(key); end

          sig { returns(T.untyped) }
          def content_security_policy?; end

          sig { returns(T.untyped) }
          def content_security_policy_nonce; end

          sig { returns(T.untyped) }
          def cookies; end

          sig { params(form_options: T.untyped).returns(T.untyped) }
          def form_authenticity_token(form_options: T.unsafe(nil)); end

          sig { returns(T.untyped) }
          def notice; end

          sig { returns(T.untyped) }
          def protect_against_forgery?; end

          sig { returns(T.untyped) }
          def view_cache_dependencies; end
        end

        class HelperProxy < ::ActionView::Base
          include HelperMethods
        end

        sig { returns(HelperProxy) }
        def helpers; end
      end
    end
  end
end