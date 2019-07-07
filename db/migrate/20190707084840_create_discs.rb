class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :product_id
      t.string :disk_name
      t.integer :disk_order
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
