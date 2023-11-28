# typed: true

ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'mocha/minitest'
require 'vcr'

class ActionDispatch::IntegrationTest
  private

  def auth_headers_for(user)
    token = JsonWebToken.encode(payload: { user_id: user.id })
    { 'Authorization': "Bearer #{token}" }
  end
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  record_mode = if ENV['VCR'].present?
    T.must(ENV['VCR']).to_sym
  else
    :once
  end

  VCR.configure do |config|
    config.cassette_library_dir = "test/vcr/cassettes"
    config.hook_into :webmock
    config.default_cassette_options = {
      record: record_mode,
      decode_compressed_response:     true,
      allow_unused_http_interactions: false,
    }

    config.filter_sensitive_data("<PLAID SECRET>") { ENV['PLAID_SECRET'] }
    config.filter_sensitive_data("<PLAID CLIENT ID>") { ENV['PLAID_CLIENT_ID'] }
  end

  private

  def use_vcr
    vcr_name = "#{T.must(self.class.name).underscore}__#{T.must(T.must(caller[0])[/`.*'/])[1..-2]}"
    VCR.use_cassette(vcr_name, allow_playback_repeats: true) do |cass|
      yield(cass)
    end
  end

  def sandbox_public_token_create
    plaid_client.sandbox_public_token_create(Plaid::SandboxPublicTokenCreateRequest.new(
        institution_id: 'ins_43',
        initial_products: ['transactions']
      )
    ).public_token
  end

  def sandbox_access_token_create
    public_token = plaid_client.sandbox_public_token_create(Plaid::SandboxPublicTokenCreateRequest.new(
        institution_id: 'ins_43',
        initial_products: ['transactions']
      )
    ).public_token

    request = Plaid::ItemPublicTokenExchangeRequest.new({ public_token: public_token })
    response = plaid_client.item_public_token_exchange(request)
    response.access_token
  end

  def plaid_client
    @client ||= Plaid::PlaidApi.new(plaid_config)
  end

  def plaid_config
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment[ENV["PLAID_ENVIRONMENT"]]
    configuration.api_key["PLAID-CLIENT-ID"] = ENV["PLAID_CLIENT_ID"]
    configuration.api_key["PLAID-SECRET"] = ENV["PLAID_SECRET"]
    configuration.api_key["Plaid-Version"] = ENV["PLAID_API_VERSION"]
    api_client = Plaid::ApiClient.new(
      configuration
    )
  end
end

