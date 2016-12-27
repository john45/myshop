class CreateRelatedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :related_products do |t|
      t.binary :product_id
      t.binary :assotiated_id

      t.timestamps
    end
  end
end
