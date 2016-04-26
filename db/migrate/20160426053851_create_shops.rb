class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :account_id, index: true

      t.timestamps null: false
    end
  end
end
