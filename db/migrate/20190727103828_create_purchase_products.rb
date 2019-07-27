class CreatePurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_products do |t|
      t.integer :purchase_id
      t.integer :quanity
      t.integer :price
      t.boolean :status
      t.integer :product_id

      t.timestamps
    end
  end
end
