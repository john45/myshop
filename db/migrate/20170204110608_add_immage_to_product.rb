class AddImmageToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :immage, :string
  end
end
