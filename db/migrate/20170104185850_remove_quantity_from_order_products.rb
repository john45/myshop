class RemoveQuantityFromOrderProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_products, :quantity
    add_column :order_products, :quantity, :integer, default: 1
  end
end
