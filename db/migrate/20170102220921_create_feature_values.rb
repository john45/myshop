class CreateFeatureValues < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_values, id: false do |t|
      t.string :title
      t.integer :feature_id
      t.integer :product_id

      t.timestamps
    end
  end
end
