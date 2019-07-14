class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.string :song_name
      t.integer :song_order
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
