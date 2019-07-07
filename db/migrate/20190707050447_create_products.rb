class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_id
      t.string :product_name
      t.integer :label_id
      t.integer :genre_id
      t.string :price
      t.string :stock
      t.boolean :status
      t.integer :artist_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
