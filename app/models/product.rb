# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(8, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Product < ApplicationRecord
  has_many :related_products
  has_many :reviews
  has_many :feature_values
  has_many :features, through: :feature_values
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :category

  before_destroy :ensure_not_referenced_by_any_order_product
  
  private
    def ensure_not_referenced_by_any_order_product
      if order_products.empty?
        return true
      else
        errors.add(:base, 'In order_products now')
        return false
      end
    end
end
