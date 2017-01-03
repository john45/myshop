class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products, id: false do |t|
      t.integer :order_id
      t.integer :product_id
      t.decimal :actual_price, precision: 8, scale: 2, default: 0.0
      t.integer :quantity

      t.timestamps
    end
  end
end
