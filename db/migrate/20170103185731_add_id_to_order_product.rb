class AddIdToOrderProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :id, :integer
    add_index :order_products, :id
  end
end
