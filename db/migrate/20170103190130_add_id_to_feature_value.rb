class AddIdToFeatureValue < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_products, :id
    add_column :order_products, :id, :primary_key
    add_index :order_products, :id

    add_column :feature_values, :id, :primary_key
    add_index :feature_values, :id
  end
end
