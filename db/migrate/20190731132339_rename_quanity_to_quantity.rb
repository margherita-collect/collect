class RenameQuanityToQuantity < ActiveRecord::Migration[5.2]
  def change
  	rename_column :purchase_products, :quanity, :quantity
  end
end
