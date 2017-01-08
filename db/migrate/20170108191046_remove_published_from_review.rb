class RemovePublishedFromReview < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :published
    add_column :reviews, :published, :boolean, default: false
  end
end
