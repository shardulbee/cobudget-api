# typed: strict

module PlaidAdaptor
  DATE_FORMAT = '%Y-%m-%d'

  class Institution < T::Struct
    const :item_id, String
    const :access_token, String
  end

  class AccountType < T::Enum
    enums do
      Checking = new('checking')
      Savings = new('savings')
    end
  end

  class Account < T::Struct
    include T::Struct::ActsAsComparable
    const :id, String
    const :name, String
    const :official_name, String
    const :type, AccountType
    const :balance, Money
    const :mask, String
  end

  class Transaction < T::Struct
    include T::Struct::ActsAsComparable
    const :id, String
    const :name, String
    const :amount,Money
    const :occurred_on, Date
  end

  class Environment < T::Enum
    enums do
      Sandbox = new('sandbox')
      Development = new('development')
      Production = new('production')
    end
  end
end
