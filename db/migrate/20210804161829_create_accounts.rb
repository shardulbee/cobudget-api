# typed: false
class CreateAccounts < ActiveRecord::Migration[6.1]
def change
    create_table :accounts do |t|
      t.string :name
      t.string :remote_id
      t.decimal :balance, precision: 21, scale: 3
      t.string :currency, limit: 3
      t.string :official_name
      t.string :account_type
      t.string :mask
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
