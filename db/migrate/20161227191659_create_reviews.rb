class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :product_id
      t.text :body
      t.integer :rating
      t.string :email
      t.boolean :published

      t.timestamps
    end
  end
end
