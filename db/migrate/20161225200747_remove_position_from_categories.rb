class RemovePositionFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :position
  end
end
