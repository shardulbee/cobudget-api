# typed: false
class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :access_token
      t.string :item_id
      t.references :user

      t.timestamps
    end
  end
end
