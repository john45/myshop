class AddCartIdToOrderProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :cart_id, :integer
    add_index :order_products, :cart_id
  end
end
