# typed: strict

module PlaidAdaptor
  class Client
    extend T::Sig

    sig { void }
    def initialize
      configuration = Plaid::Configuration.new
      configuration.server_index = Plaid::Configuration::Environment[ENV["PLAID_ENVIRONMENT"]]
      configuration.api_key["PLAID-CLIENT-ID"] = ENV["PLAID_CLIENT_ID"]
      configuration.api_key["PLAID-SECRET"] = ENV["PLAID_SECRET"]
      configuration.api_key["Plaid-Version"] = ENV["PLAID_API_VERSION"]
      api_client = Plaid::ApiClient.new(
        configuration
      )

      @client = T.let(Plaid::PlaidApi.new(api_client), Plaid::PlaidApi)
    end

    sig { params(id: Integer).returns(String) }
    def create_link_token(id:)
      link_token_create_request = Plaid::LinkTokenCreateRequest.new({
        :user => { :client_user_id => id.to_s },
        :client_name => 'turbochardo\'s app',
        :products => %w[auth transactions],
        :country_codes => ['CA'],
        :language => 'en'
      })

      link_token_response = @client.link_token_create(
        link_token_create_request
      )

      link_token_response.link_token
    end

    sig { params(public_token: String).returns(Institution)}
    def exchange(public_token:)
      request = Plaid::ItemPublicTokenExchangeRequest.new({ public_token: public_token })
      response = @client.item_public_token_exchange(request)
      Institution.new(
        item_id: response.item_id,
        access_token: response.access_token
      )
    end

    sig { params(access_token: String).returns(T::Array[Account]) }
    def fetch_accounts(access_token:)
      plaid_accounts = @client.accounts_get(
        Plaid::AccountsGetRequest.new(access_token: access_token)
      ).accounts.map do |plaid_account|
        next unless AccountType.values.map(&:serialize).include?(plaid_account.subtype)
        Account.new(
          id: plaid_account.account_id,
          balance: Money.new(plaid_account.balances.current, plaid_account.balances.iso_currency_code),
          mask: plaid_account.mask,
          name: plaid_account.name,
          official_name: plaid_account.official_name,
          type: AccountType.deserialize(plaid_account.subtype),
        )
      end.compact
    end

    sig { params(access_token: String, account_id: String, start_date: Date, end_date: Date).returns(T::Array[Transaction]) }
    def fetch_transactions(access_token:, account_id:, start_date:, end_date:)
      plaid_transactions = @client.transactions_get(Plaid::TransactionsGetRequest.new(
        access_token: access_token,
        start_date: start_date,
        end_date: end_date,
        options: Plaid::TransactionsGetRequestOptions.new(account_ids: account_id)
      )).transactions.map do |transaction|
        Transaction.new(
          id: transaction.transaction_id,
          name: transaction.name,
          amount: Money.new(transaction.amount, transaction.iso_currency_code),
          occurred_on: Date.strptime(transaction.date, DATE_FORMAT)
        )
      end
    end
  end
end