class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  acts_as_list

  scope :sorted, -> { order(:position) }
end

