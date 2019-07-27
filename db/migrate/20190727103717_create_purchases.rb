class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :zip_code
      t.string :address

      t.timestamps
    end
  end
end
