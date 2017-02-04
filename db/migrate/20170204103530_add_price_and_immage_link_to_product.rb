class AddPriceAndImmageLinkToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_old, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
