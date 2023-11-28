# typed: false
class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :remote_id
      t.decimal :amount, precision: 21, scale: 3
      t.references :account, null: false, foreign_key: true
      t.string :currency, limit: 3
      t.date :occurred_on

      t.timestamps
    end
  end
end
