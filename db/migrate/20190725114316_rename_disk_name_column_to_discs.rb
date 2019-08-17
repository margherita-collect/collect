class RenameDiskNameColumnToDiscs < ActiveRecord::Migration[5.2]
  def change
    rename_column :discs, :disk_name, :disc_name
    rename_column :discs, :disk_order, :disc_order
  end
end
